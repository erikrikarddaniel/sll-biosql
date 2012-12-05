class RemoveTypeFromTaxonAttributes < ActiveRecord::Migration
  def up
    remove_column :taxon_attributes, :type
  end

  def down
    add_column :taxon_attributes, :type, :string
  end
end
