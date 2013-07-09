# The taxmap file is created with the following command:
#   psql --tuples-only -c "SELECT tn.name, t.ncbi_taxon_id FROM taxon_name tn JOIN taxon t ON tn.taxon_id = t.taxon_id WHERE tn.name_class = 'scientific name'" biosqlprod | sed 's/^ //' | sed 's/ \+| \+/<tabb>/' > ncbi.taxmap
#
# The listing, the .lslR file, is the result of:
#   ll -R /bubo/nobackup/uppnex/reference/Bacteria/ftp.ncbi.nih.gov/ > ~/ncbi_ftp_genomes.llR
%.ncbitaxid2path: ncbi.taxmap %.lslR
	../scripts/dirlist2format --taxmap=$^ > $@
