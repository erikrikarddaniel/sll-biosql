class CreateSequencedGenomes < ActiveRecord::Migration
  def change
    create_table :sequenced_genomes, :primary_key => 'ncbi_taxon_id' do |t|
      t.integer :ncbi_taxon_id, :null => false
      t.boolean :wgs
    end
  end
end
