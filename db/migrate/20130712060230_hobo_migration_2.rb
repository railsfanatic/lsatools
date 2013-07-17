class HoboMigration2 < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.integer  :position
      t.text     :content
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :agenda_item_id
    end
    add_index :notes, [:agenda_item_id]

    create_table :tasks do |t|
      t.datetime :due_at
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :agenda_item_id
    end
    add_index :tasks, [:agenda_item_id]

    create_table :task_assignments do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
      t.integer  :task_id
    end
    add_index :task_assignments, [:user_id]
    add_index :task_assignments, [:task_id]

    add_column :agenda_items, :notes_count, :integer, :default => 0, :null => false
    add_column :agenda_items, :tasks_count, :integer, :default => 0, :null => false

    add_column :meetings, :agenda_items_count, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :agenda_items, :notes_count
    remove_column :agenda_items, :tasks_count

    remove_column :meetings, :agenda_items_count

    drop_table :notes
    drop_table :tasks
    drop_table :task_assignments
  end
end
