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

ActiveRecord::Schema.define(version: 20141014114220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: true do |t|
    t.string   "batchname"
    t.integer  "batchyear"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "electivgroups", force: true do |t|
    t.integer  "batch_id"
    t.string   "groupname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "electivgroups", ["batch_id"], name: "index_electivgroups_on_batch_id", using: :btree

  create_table "subjects", force: true do |t|
    t.integer  "batch_id"
    t.integer  "electivgroup_id"
    t.string   "subjectname"
    t.string   "subjectcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subjects", ["batch_id"], name: "index_subjects_on_batch_id", using: :btree
  add_index "subjects", ["electivgroup_id"], name: "index_subjects_on_electivgroup_id", using: :btree

end
