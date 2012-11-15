class CreateOrganismGroupRows < ActiveRecord::Migration
  def change
    create_table :organism_group_rows do |t|
      t.integer :organism_group_id
      t.integer :ncbi_taxon_id, :references => nil

      t.timestamps
    end
  end
end
