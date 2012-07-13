CREATE TABLE protein_gi_to_taxids (
  gi	INTEGER,
  taxid	INTEGER
);

CREATE UNIQUE INDEX protein_gi_to_taxids_gi_uindex ON
  protein_gi_to_taxids(gi)
;
