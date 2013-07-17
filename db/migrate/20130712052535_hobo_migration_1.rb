class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :agenda_items do |t|
      t.integer  :position
      t.string   :title
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :meeting_id
    end
    add_index :agenda_items, [:meeting_id]

    create_table :meetings do |t|
      t.datetime :begin_at
      t.string   :location
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :agenda_items
    drop_table :meetings
  end
end
