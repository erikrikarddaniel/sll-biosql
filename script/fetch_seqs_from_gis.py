#!/usr/bin/env python
# -*- coding: utf-8 -*-

from Bio import Entrez
from Bio import SeqIO
from BioSQL import BioSeqDatabase
import psycopg2 # NEED v. 2.5 to use the "with" context manager
import logging


# CONSTANTS
LOG_FILE = "/tmp/fetch_seqs_from_gis"
SAVE_FILE = "/tmp/"
EMAIL = "binni@binnisb.com"
TOOL = "sll_biosql"
DB_NAME = "sll_biosql"

# BASE LOGGING CONFIG
logging.basicConfig(
  filename=LOG_FILE,
  level=logging.INFO,
  filemode='a', # append to log file
  format='%(asctime)s:%(levelname)s:%(name)s:%(message)s'
)


# GET bioentries gis that have already been imported.
# GET gi_queues that have not been imported
# SELECT thouse gis that are not fetched and not in bioentry
with psycopg2.connect("dbname='biosqldev' user='binni' host='localhost' password=''") as conn:
  with conn.cursor() as cur:
    cur.execute("""SELECT biodatabase_id FROM biodatabase WHERE name = %s""",(DB_NAME,))
    biodb_id = cur.fetchone()
    cur.execute("""SELECT identifier FROM bioentry WHERE biodatabase_id = %s""", biodb_id)
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
  if DB_NAME in server:
    db = server[DB_NAME]
  else:
    db = server.new_database(DB_NAME, description="sll biosql test")
    server.commit()
        
  Entrez.email = EMAIL
  Entrez.tool = TOOL
    
  fh = Entrez.efetch(db="protein", rettype="gp", retmode="text",id=list(fetch_gis))
  seqs = list(SeqIO.parse(fh, "gb"))
  map(lambda seq: SeqIO.write(seq,SAVE_FILE+seq.annotations["gi"]+".gb","genbank"),seqs)
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



