class CreateGiQueues < ActiveRecord::Migration
  def change
    create_table :gi_queues do |t|
      t.string	:gi,		null: false
      t.boolean	:fetched,	default: false
      t.timestamps
      t.index :gi,	unique: true
    end
  end
end
