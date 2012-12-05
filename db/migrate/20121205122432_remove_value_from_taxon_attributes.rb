class RemoveValueFromTaxonAttributes < ActiveRecord::Migration
  def up
    remove_column :taxon_attributes, :value
  end

  def down
    add_column :taxon_attributes, :value, :string
  end
end
