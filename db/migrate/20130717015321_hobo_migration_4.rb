class HoboMigration4 < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string   :name
      t.integer  :priority
      t.integer  :agenda_items_count
      t.integer  :projects_count
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :projects do |t|
      t.string   :name
      t.integer  :priority
      t.integer  :agenda_items_count
      t.datetime :created_at
      t.datetime :updated_at
    end

    rename_column :agenda_items, :position, :priority
    add_column :agenda_items, :topic_id, :integer
    add_column :agenda_items, :project_id, :integer

    add_index :agenda_items, [:topic_id]
    add_index :agenda_items, [:project_id]
  end

  def self.down
    rename_column :agenda_items, :priority, :position
    remove_column :agenda_items, :topic_id
    remove_column :agenda_items, :project_id

    drop_table :topics
    drop_table :projects

    remove_index :agenda_items, :name => :index_agenda_items_on_topic_id rescue ActiveRecord::StatementInvalid
    remove_index :agenda_items, :name => :index_agenda_items_on_project_id rescue ActiveRecord::StatementInvalid
  end
end
