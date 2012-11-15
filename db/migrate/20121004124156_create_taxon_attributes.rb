class CreateTaxonAttributes < ActiveRecord::Migration
  def change
    create_table :taxon_attributes do |t|
      t.integer :ncbi_taxon_id, :references => nil
      t.string :type
      t.string :value

      t.timestamps
    end
  end
end
