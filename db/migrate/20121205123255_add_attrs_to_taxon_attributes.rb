class AddAttrsToTaxonAttributes < ActiveRecord::Migration
  def change
    add_column :taxon_attributes, :attrs, :string
  end
end
