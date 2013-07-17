class HoboMigration8 < ActiveRecord::Migration
  def self.up
    rename_column :projects, :start_at, :begin_at
  end

  def self.down
    rename_column :projects, :begin_at, :start_at
  end
end
