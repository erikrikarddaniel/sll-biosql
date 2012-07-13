class CreateTaxonWithName < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE VIEW taxon_with_name AS
  SELECT
    t.taxon_id,
    t.parent_taxon_id,
    t.ncbi_taxon_id,
    t.node_rank,
    t.genetic_code,
    t.mito_genetic_code,
    t.left_value,
    t.right_value,
    tn.name AS scientific_name,
    sg.wgs
  FROM
    taxon t JOIN
    taxon_name tn ON t.taxon_id = tn.taxon_id LEFT JOIN
    sequenced_genomes sg ON t.ncbi_taxon_id = sg.ncbi_taxon_id
  WHERE
    tn.name_class = 'scientific name'
SQL
  end

  def down
    execute "DROP VIEW taxon_with_name"
  end
end
