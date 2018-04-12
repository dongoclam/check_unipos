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

ActiveRecord::Schema.define(version: 20180406142630) do

  create_table "chatwork_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
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

  create_table "uniposes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
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

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
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
