# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130717092301) do

  create_table "agenda_items", :force => true do |t|
    t.integer  "position"
    t.string   "title"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "meeting_id"
    t.integer  "tasks_count", :default => 0, :null => false
    t.integer  "topic_id"
    t.integer  "project_id"
  end

  add_index "agenda_items", ["meeting_id"], :name => "index_agenda_items_on_meeting_id"
  add_index "agenda_items", ["project_id"], :name => "index_agenda_items_on_project_id"
  add_index "agenda_items", ["topic_id"], :name => "index_agenda_items_on_topic_id"

  create_table "meetings", :force => true do |t|
    t.datetime "begin_at"
    t.string   "location"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "agenda_items_count", :default => 0, :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "agenda_items_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "begin_at"
    t.datetime "end_at"
    t.integer  "topic_id"
  end

  add_index "projects", ["topic_id"], :name => "index_projects_on_topic_id"

  create_table "task_assignments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "task_id"
  end

  add_index "task_assignments", ["task_id"], :name => "index_task_assignments_on_task_id"
  add_index "task_assignments", ["user_id"], :name => "index_task_assignments_on_user_id"

  create_table "tasks", :force => true do |t|
    t.datetime "due_at"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "agenda_item_id"
    t.integer  "position"
  end

  add_index "tasks", ["agenda_item_id"], :name => "index_tasks_on_agenda_item_id"

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "agenda_items_count"
    t.integer  "projects_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "invited"
    t.datetime "key_timestamp"
    t.integer  "task_assignments_count"
  end

  add_index "users", ["state"], :name => "index_users_on_state"

end
