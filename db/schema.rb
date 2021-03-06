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

ActiveRecord::Schema.define(version: 20140904201334) do

  create_table "blogs", force: true do |t|
    t.string   "title"
    t.string   "image"
    t.text     "intro"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "released",   default: false
    t.text     "body"
  end

  add_index "blogs", ["released"], name: "index_blogs_on_released", using: :btree
  add_index "blogs", ["title"], name: "index_blogs_on_title", using: :btree
  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "blog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["blog_id"], name: "index_comments_on_blog_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                              null: false
    t.string   "token"
    t.datetime "confirmed_at"
    t.string   "password_digest",                    null: false
    t.string   "account",         default: "member"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
  end

  add_index "users", ["confirmed_at"], name: "index_users_on_confirmed_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
