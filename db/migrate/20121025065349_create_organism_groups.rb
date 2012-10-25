class CreateOrganismGroups < ActiveRecord::Migration
  def change
    create_table :organism_groups do |t|
      t.string :name
      t.boolean :test

      t.timestamps
    end
  end
end
