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

  create_table "chatwork_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "avatar"
    t.integer "chatwork_id"
    t.string "chatwork_name"
    t.string "phone"
    t.string "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatwork_id"], name: "index_chatwork_users_on_chatwork_id", unique: true
    t.index ["chatwork_name"], name: "index_chatwork_users_on_chatwork_name", unique: true
    t.index ["email"], name: "index_chatwork_users_on_email", unique: true
  end

  create_table "uniposes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "sender"
    t.integer "receiver"
    t.integer "point"
    t.string "message"
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sender", "receiver", "sent_at"], name: "index_uniposes_on_sender_and_receiver_and_sent_at", unique: true
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "avatar"
    t.string "unipos_id"
    t.string "unipos_name"
    t.integer "total_sent"
    t.integer "total_received"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["total_received"], name: "index_users_on_total_received"
    t.index ["total_sent"], name: "index_users_on_total_sent"
    t.index ["unipos_id"], name: "index_users_on_unipos_id", unique: true
    t.index ["unipos_name"], name: "index_users_on_unipos_name", unique: true
  end

end
