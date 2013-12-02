all_sequenced_genomes.csv: gold.csv phantome_genomes.csv ncbi_viruses.tsv
	sort -u $^ > $@

ncbi_viruses.tsv: ncbi_dna_virus_names.tsv
	psql $(DB) -c "CREATE TABLE IF NOT EXISTS virusnames ( name TEXT );"
	psql $(DB) -c "TRUNCATE TABLE virusnames"
	psql $(DB) -c "COPY virusnames FROM STDIN;" < $<
	psql $(DB) --tuples-only -c "SELECT t.ncbi_taxon_id, 'true' FROM virusnames vn JOIN taxon_name tn ON vn.name = tn.name JOIN taxon t ON tn.taxon_id = t.taxon_id"| sed "s/ *| */\t/" | sed "s/^  *//" | sed "s/  *$$//" | grep -v "^ *$$" > $@
