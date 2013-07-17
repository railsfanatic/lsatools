class HoboMigration6 < ActiveRecord::Migration
  def self.up
    add_column :projects, :topic_id, :integer

    add_index :projects, [:topic_id]
  end

  def self.down
    remove_column :projects, :topic_id

    remove_index :projects, :name => :index_projects_on_topic_id rescue ActiveRecord::StatementInvalid
  end
end
