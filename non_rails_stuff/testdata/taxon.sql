-- root
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(1, 1, 1, 'no rank', 1, 0, 1, 1830838)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(1, 'root', 'scientific name')
;
-- cellular organisms
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(102629, 131567, 1, 'no rank', 1, 0, 199140, 1830837)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(1, 'cellular organisms', 'scientific name')
;
-- other sequences
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(12262, 28384, 1, 'no rank', 1, 0, 186244, 199139)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(1, 'other sequences', 'scientific name')
;
-- unclassified sequences
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(10063, 12908, 1, 'no rank', 1, 0, 185380, 186243)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(1, 'unclassified sequences', 'scientific name')
;
-- Viroids
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(10041, 12884, 1, 'superkingdom', 1, 0, 185202, 185379)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(1, 'Viroids', 'scientific name')
;
-- Viruses
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(8380, 10239, 1, 'superkingdom', 1, 0, 2, 185201)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(1, 'Viruses', 'scientific name')
;
-- Eukaryota
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(2170, 2759, 102629, 'superkingdom', 1, 0, 710171, 1830836)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(1, 'Eukaryota', 'scientific name')
;
-- Archaea
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(1706, 2157, 102629, 'superkingdom', 1, 0, 697249, 710170)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(1, 'Archaea', 'scientific name')
;
-- Bacteria
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(2, 2, 102629, 'superkingdom', 1, 0, 199141, 697248)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(1, 'Bacteria', 'scientific name')
;
