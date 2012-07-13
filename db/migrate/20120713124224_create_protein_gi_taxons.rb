class CreateProteinGiTaxons < ActiveRecord::Migration
  def change
    create_table :protein_gi_taxons, :primary_key => 'protein_gi' do |t|
      t.integer :protein_gi, :null => false
      t.integer :taxon_id
    end
  end
end
