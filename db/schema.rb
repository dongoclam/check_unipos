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

ActiveRecord::Schema.define(version: 20180518163733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["name"], name: "index_admins_on_name", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "chatwork_users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "avatar"
    t.integer "chatwork_id"
    t.string "chatwork_name"
    t.string "phone"
    t.text "department"
    t.boolean "checked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatwork_id"], name: "index_chatwork_users_on_chatwork_id", unique: true
    t.index ["chatwork_name"], name: "index_chatwork_users_on_chatwork_name"
    t.index ["email"], name: "index_chatwork_users_on_email", unique: true
  end

  create_table "settings", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "key_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key_name"], name: "index_tags_on_key_name", unique: true
  end

  create_table "uniposes", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.integer "point"
    t.text "message"
    t.string "unipos_id"
    t.integer "reaction"
    t.integer "praise_count"
    t.integer "self_praise_count"
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_uniposes_on_receiver_id"
    t.index ["sender_id"], name: "index_uniposes_on_sender_id"
    t.index ["unipos_id"], name: "index_uniposes_on_unipos_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "avatar"
    t.string "unipos_id"
    t.string "unipos_name"
    t.integer "total_sent"
    t.integer "total_received"
    t.integer "total_clapped"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["total_clapped"], name: "index_users_on_total_clapped"
    t.index ["total_received"], name: "index_users_on_total_received"
    t.index ["total_sent"], name: "index_users_on_total_sent"
    t.index ["unipos_id"], name: "index_users_on_unipos_id", unique: true
    t.index ["unipos_name"], name: "index_users_on_unipos_name"
  end

end
