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

ActiveRecord::Schema.define(version: 20160413182326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "landmarks", force: :cascade do |t|
    t.string   "caption"
    t.string   "location"
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "landmarks", ["user_id"], name: "index_landmarks_on_user_id", using: :btree

  create_table "landmarks_tours", id: false, force: :cascade do |t|
    t.integer "landmark_id", null: false
    t.integer "tour_id",     null: false
  end

  add_index "landmarks_tours", ["landmark_id", "tour_id"], name: "index_landmarks_tours_on_landmark_id_and_tour_id", using: :btree
  add_index "landmarks_tours", ["tour_id", "landmark_id"], name: "index_landmarks_tours_on_tour_id_and_landmark_id", using: :btree

  create_table "tours", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tours", ["user_id"], name: "index_tours_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "profile_pic"
    t.string   "tagline"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "landmarks", "users"
  add_foreign_key "tours", "users"
end
