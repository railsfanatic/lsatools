class HoboMigration3 < ActiveRecord::Migration
  def self.up
    drop_table :notes

    rename_column :agenda_items, :description, :notes
    remove_column :agenda_items, :notes_count

    add_column :users, :task_assignments_count, :integer
  end

  def self.down
    rename_column :agenda_items, :notes, :description
    add_column :agenda_items, :notes_count, :integer, :default => 0, :null => false

    remove_column :users, :task_assignments_count

    create_table "notes", :force => true do |t|
      t.integer  "position"
      t.text     "content"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "agenda_item_id"
    end

    add_index "notes", ["agenda_item_id"], :name => "index_notes_on_agenda_item_id"
  end
end
