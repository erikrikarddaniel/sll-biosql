#!/usr/bin/env python
# -*- coding: utf-8 -*-

from Bio import Entrez
from Bio import SeqIO
from BioSQL import BioSeqDatabase
from argparse import ArgumentParser

import os
import gzip
import psycopg2 # NEED v. 2.5 to use the "with" context manager
import logging

def fetch_gis(email,
	      db_name,
	      db_user,
	      db_password,
	      tool,
	      log_file, 
              save_file_directory):

  # BASE LOGGING CONFIG
  logging.basicConfig(
    filename=log_file,
    level=logging.INFO,
    filemode='a', # append to log file
    format='%(asctime)s:%(levelname)s:%(name)s:%(message)s'
  )
  
  
  # GET bioentries gis that have already been imported.
  # GET gi_queues that have not been imported
  # SELECT thouse gis that are not fetched and not in bioentry
  with psycopg2.connect("dbname='%s' host='localhost'" % (db_name)) as conn:
    with conn.cursor() as cur:
      cur.execute("""SELECT identifier FROM bioentry""")
      bioentry_ids = set(map(lambda x: x[0], cur.fetchall()))
      logging.info("found {0} gis in bioentry".format(len(bioentry_ids)))
      cur.execute("""SELECT gi FROM gi_queues WHERE fetched IS false""")
      gi_queues_ids = set(map(lambda x: x[0], cur.fetchall()))
      logging.info("found {0} gis in qi_queues".format(len(gi_queues_ids)))
      fetch_gis = gi_queues_ids - bioentry_ids
      logging.info("will fetch {0} gis from ncbi ({1})".format(len(fetch_gis),",".join(fetch_gis)))
  
  
  # SELECT the biodatabase to use
  # GET proteins from NCBI
  # IMPORT proteins to bioentries
  # LOG which gis imported and which failed
  try:
    server = BioSeqDatabase.open_database(driver="psycopg2", user="binni", 
                                          passwd="", host="localhost", 
                                          db="biosqldev")
    if db_name in server:
      db = server[db_name]
    else:
      db = server.new_database(db_name, description="sll biosql test")
      server.commit()
          
    Entrez.email = email
    Entrez.tool = tool
      
    fh = Entrez.efetch(db="protein", rettype="gp", retmode="text",id=list(fetch_gis))
    seqs = list(SeqIO.parse(fh, "gb"))

    for seq in seqs:
      f = gzip.open(os.path.join(save_file_directory,seq.annotations["gi"]+".gb.gz"), 'wb')
      SeqIO.write(seq,f,"genbank")
    logging.info("Fetched {0} sequences from NCBI.".format(len(seqs)))
    count = db.load(seqs)
    logging.info("Inserted {0} sequences into biosql".format(count))
      
    if count != len(fetch_gis):
      logging.warn("Not equally many gis to fetch as were inserted")
    not_fetched_gis = set()
    for i in list(fetch_gis):
      try:
        entry = db.lookup(gi=i)
        logging.info("Gi: {0} inserted in database".format(i))
      except IndexError as e:
        logging.warn("Gi: {0} not inserted in database".format(i))
        not_fetched_gis.add(i)
    server.commit()
  except Exception as e:
    print "Error: {0}".format(e)
  finally:
    fh.close()
    server.close()
  
  
  # UPDATE gi_queue entries that have been fetched
  with psycopg2.connect("dbname='biosqldev' user='binni' host='localhost' password=''") as conn:
    with conn.cursor() as cur:
      cur.execute("""UPDATE gi_queues SET fetched=true,updated_at=now() WHERE gi IN ('{0}')"""
                  .format("','".join(fetch_gis - not_fetched_gis)))
      logging.info("Updated status of {0} gi_queues rows out of {1} gis that were added to bioentry".format(cur.rowcount,count))

if __name__=="__main__":
  parser = ArgumentParser(description="Script to fetch protein sequences from NCBI with gis in gi_queue")
  parser.add_argument("email",
		      help="Email for NCBI web service")
  parser.add_argument("db_name", 
		      help="Define the database name")
  parser.add_argument("db_user", 
		      help="Define the database user")
  parser.add_argument("db_password", 
		      help="Define the database user password")
  parser.add_argument("-t", "-tool", 
		      dest="tool",
		      help="Define the tool name for NCBI web service")
  parser.add_argument("-s", "--save_file_directory", 
		      dest="save_file_directory",
		      default="/tmp/",
		      help="Define the save file directory")
  parser.add_argument("-l", "--log_file", 
		      dest="log_file",
		      default="/tmp/fetched_log",
		      help="Define the log_file")
  args = parser.parse_args()

  fetch_gis(**vars(args))

