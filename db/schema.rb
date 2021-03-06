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

ActiveRecord::Schema.define(version: 7) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dictionaries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dictionaries", ["name"], name: "index_dictionaries_on_name", unique: true, using: :btree

  create_table "entries", force: :cascade do |t|
    t.string   "name"
    t.integer  "dictionary_id"
    t.string   "base_url"
    t.string   "thumbnail_small"
    t.string   "thumbnail_medium"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "panda_video_id"
    t.string   "mp4"
    t.string   "webm"
    t.string   "screenshot"
  end

  add_index "entries", ["dictionary_id", "name"], name: "index_entries_on_dictionary_id_and_name", unique: true, using: :btree

  create_table "homophones", force: :cascade do |t|
    t.string   "name"
    t.integer  "entry_id"
    t.integer  "dictionary_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "homophones", ["dictionary_id", "name"], name: "index_homophones_on_dictionary_id_and_name", unique: true, using: :btree

end
