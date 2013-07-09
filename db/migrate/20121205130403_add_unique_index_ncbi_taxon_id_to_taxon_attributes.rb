class AddUniqueIndexNcbiTaxonIdToTaxonAttributes < ActiveRecord::Migration
  def change
    change_table :taxon_attributes do |t|
      t.index :ncbi_taxon_id, unique: true
    end
  end
end
