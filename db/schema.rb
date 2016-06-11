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

ActiveRecord::Schema.define(version: 20160611124009) do

  create_table "categories", force: :cascade do |t|
    t.string   "category_name", limit: 255
    t.string   "photo",         limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string   "deviceID",     limit: 255
    t.string   "email",        limit: 255, default: ""
    t.string   "message",      limit: 255, default: ""
    t.boolean  "likes",                    default: false
    t.float    "rating_value", limit: 24
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "place_id",     limit: 4,                   null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "location_name", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "place_name",        limit: 255
    t.integer  "location_id",       limit: 4
    t.integer  "category_id",       limit: 4
    t.string   "address",           limit: 255
    t.float    "latitude",          limit: 53,  null: false
    t.float    "longitude",         limit: 53,  null: false
    t.string   "short_description", limit: 255
    t.string   "photo",             limit: 255
    t.string   "contact_number",    limit: 255
    t.string   "contact_person",    limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "places", ["category_id"], name: "index_places_on_category_id", using: :btree
  add_index "places", ["location_id"], name: "index_places_on_location_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
