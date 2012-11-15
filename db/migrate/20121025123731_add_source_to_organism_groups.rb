class AddSourceToOrganismGroups < ActiveRecord::Migration
  def change
    add_column :organism_groups, :source, :text
  end
end
