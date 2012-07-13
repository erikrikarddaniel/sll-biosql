class CreateFetchGis < ActiveRecord::Migration
  def change
    create_table :fetch_gis do |t|
      t.integer :gi

      t.timestamps
    end
  end
end
