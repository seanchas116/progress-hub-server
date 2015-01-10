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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150110133651) do

  create_table "project_stars", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "project_stars", ["project_id"], name: "index_project_stars_on_project_id"
  add_index "project_stars", ["user_id", "project_id"], name: "index_project_stars_on_user_id_and_project_id", unique: true
  add_index "project_stars", ["user_id"], name: "index_project_stars_on_user_id"

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followee_id"], name: "index_relationships_on_followee_id"
  add_index "relationships", ["follower_id", "followee_id"], name: "index_relationships_on_follower_id_and_followee_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "status_stars", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "status_stars", ["status_id"], name: "index_status_stars_on_status_id"
  add_index "status_stars", ["user_id", "status_id"], name: "index_status_stars_on_user_id_and_status_id", unique: true
  add_index "status_stars", ["user_id"], name: "index_status_stars_on_user_id"

  create_table "statuses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "type"
    t.integer  "project_id"
    t.integer  "task_id"
    t.string   "task_stage_before"
    t.string   "task_stage_after"
    t.integer  "followee_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "statuses", ["type"], name: "index_statuses_on_type"
  add_index "statuses", ["user_id"], name: "index_statuses_on_user_id"

  create_table "task_stars", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "task_stars", ["task_id"], name: "index_task_stars_on_task_id"
  add_index "task_stars", ["user_id", "task_id"], name: "index_task_stars_on_user_id_and_task_id", unique: true
  add_index "task_stars", ["user_id"], name: "index_task_stars_on_user_id"

  create_table "tasks", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "title"
    t.string   "url"
    t.string   "stage"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id"
  add_index "tasks", ["stage"], name: "index_tasks_on_stage"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "twitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["twitter_id"], name: "index_users_on_twitter_id"

end
