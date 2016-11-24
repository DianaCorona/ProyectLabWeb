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

ActiveRecord::Schema.define(version: 20161124004212) do

  create_table "calendars", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "calendars", ["user_id"], name: "index_calendars_on_user_id"

  create_table "chat_members", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "chat_members", ["group_id"], name: "index_chat_members_on_group_id"
  add_index "chat_members", ["user2_id"], name: "index_chat_members_on_user2_id"

  create_table "chats", force: :cascade do |t|
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "chats", ["group_id"], name: "index_chats_on_group_id"

  create_table "collections", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "collections", ["group_id"], name: "index_collections_on_group_id"

  create_table "events", force: :cascade do |t|
    t.integer  "calendar_id"
    t.string   "name"
    t.date     "date"
    t.string   "description"
    t.integer  "group_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "events", ["calendar_id"], name: "index_events_on_calendar_id"
  add_index "events", ["group_id"], name: "index_events_on_group_id"

  create_table "group_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user2_id"
  end

  add_index "group_lists", ["group_id"], name: "index_group_lists_on_group_id"
  add_index "group_lists", ["user2_id"], name: "index_group_lists_on_user2_id"
  add_index "group_lists", ["user_id"], name: "index_group_lists_on_user_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.date     "expDate"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "chat_member_id"
    t.integer  "chat_id"
    t.text     "text"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "messages", ["chat_id"], name: "index_messages_on_chat_id"
  add_index "messages", ["chat_member_id"], name: "index_messages_on_chat_member_id"

  create_table "notes", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "message"
    t.date     "expDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

  add_index "notes", ["group_id"], name: "index_notes_on_group_id"

  create_table "user2s", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nickname",               default: "", null: false
    t.string   "name"
    t.string   "lastName"
    t.date     "birthday"
    t.string   "phone"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "authentication_token"
  end

  add_index "user2s", ["email"], name: "index_user2s_on_email", unique: true
  add_index "user2s", ["nickname"], name: "index_user2s_on_nickname", unique: true
  add_index "user2s", ["reset_password_token"], name: "index_user2s_on_reset_password_token", unique: true

end
