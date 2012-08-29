CREATE TABLE sequenced_genomes (
  ncbi_taxon_id		integer		primary key,
  wgs			boolean		not null default false
);
