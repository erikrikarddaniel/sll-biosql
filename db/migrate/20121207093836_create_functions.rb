class CreateFunctions < ActiveRecord::Migration
  def change
    create_table :functions do |t|
      t.string :name
      t.string :source_db
      t.string :source_identifier
      t.integer :parent_id

      t.timestamps
    end
  end
end
