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

ActiveRecord::Schema.define(version: 20141010104829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "bankname"
    t.decimal  "accountno"
    t.string   "accounttype"
    t.integer  "disk_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["disk_id"], name: "index_accounts_on_disk_id", using: :btree

  create_table "disks", force: true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "address"
    t.integer  "age"
    t.string   "email"
    t.decimal  "phone"
    t.string   "bloodgroup"
    t.string   "country"
    t.string   "nationality"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
