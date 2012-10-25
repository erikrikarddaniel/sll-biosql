class AddSourceIdToOrganismGroupRows < ActiveRecord::Migration
  def change
    add_column :organism_group_rows, :source_id, :text, references: nil
  end
end
