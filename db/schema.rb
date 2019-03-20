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

ActiveRecord::Schema.define(version: 20190222102923) do

  create_table "employees", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.string   "emp_name",    limit: 255
    t.text     "designation", limit: 65535
    t.string   "image",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "employees_projects", force: :cascade do |t|
    t.integer  "project_id",  limit: 4
    t.integer  "employee_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "employees_projects", ["employee_id"], name: "index_employees_projects_on_employee_id", using: :btree
  add_index "employees_projects", ["project_id"], name: "index_employees_projects_on_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.text     "description",   limit: 65535
    t.text     "tech_stack",    limit: 65535
    t.text     "clent_details", limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "employees_projects", "employees"
  add_foreign_key "employees_projects", "projects"
end
