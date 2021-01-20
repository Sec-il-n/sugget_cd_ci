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

ActiveRecord::Schema.define(version: 2021_01_20_053919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "corporations", force: :cascade do |t|
    t.string "name", null: false
    t.string "info", null: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_corporations_on_category_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "image"
    t.bigint "suggest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["suggest_id"], name: "index_images_on_suggest_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.boolean "read", default: false
    t.bigint "user_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "suggest_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["suggest_id"], name: "index_participants_on_suggest_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "proprietorships", force: :cascade do |t|
    t.string "name", null: false
    t.string "info", null: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_proprietorships_on_category_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_rooms_on_recipient_id"
    t.index ["sender_id", "recipient_id"], name: "index_rooms_on_sender_id_and_recipient_id", unique: true
    t.index ["sender_id"], name: "index_rooms_on_sender_id"
  end

  create_table "suggest_tags", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "suggest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["suggest_id"], name: "index_suggest_tags_on_suggest_id"
    t.index ["tag_id"], name: "index_suggest_tags_on_tag_id"
  end

  create_table "suggests", force: :cascade do |t|
    t.string "title", null: false
    t.string "details", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_suggests_on_category_id"
    t.index ["user_id"], name: "index_suggests_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_image"
    t.boolean "admin", default: false
    t.bigint "corporation_id"
    t.bigint "proprietorship_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["corporation_id"], name: "index_users_on_corporation_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["proprietorship_id"], name: "index_users_on_proprietorship_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "corporations", "categories"
  add_foreign_key "images", "suggests"
  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "participants", "suggests"
  add_foreign_key "participants", "users"
  add_foreign_key "proprietorships", "categories"
  add_foreign_key "suggest_tags", "suggests"
  add_foreign_key "suggest_tags", "tags"
  add_foreign_key "suggests", "categories"
  add_foreign_key "suggests", "users"
  add_foreign_key "users", "corporations"
  add_foreign_key "users", "proprietorships"
end
