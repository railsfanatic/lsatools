class HoboMigration5 < ActiveRecord::Migration
  def self.up
    rename_column :agenda_items, :priority, :position

    rename_column :topics, :priority, :position

    rename_column :projects, :priority, :position
    add_column :projects, :start_at, :datetime
    add_column :projects, :end_at, :datetime

    add_column :tasks, :position, :integer
  end

  def self.down
    rename_column :agenda_items, :position, :priority

    rename_column :topics, :position, :priority

    rename_column :projects, :position, :priority
    remove_column :projects, :start_at
    remove_column :projects, :end_at

    remove_column :tasks, :position
  end
end
