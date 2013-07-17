class HoboMigration7 < ActiveRecord::Migration
  def self.up
    remove_column :projects, :position
  end

  def self.down
    add_column :projects, :position, :integer
  end
end
