# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_03_19_035419) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appliances", force: :cascade do |t|
    t.string "photo_url"
    t.string "name"
    t.string "address"
    t.string "availability"
    t.float "price"
    t.text "overview"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_appliances_on_user_id"
  end

  create_table "favourite_lists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_favourite_lists_on_user_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "appliance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "favourite_list_id"
    t.index ["appliance_id"], name: "index_favourites_on_appliance_id"
    t.index ["favourite_list_id"], name: "index_favourites_on_favourite_list_id"
  end

  create_table "offers", force: :cascade do |t|
    t.date "check_in_date"
    t.date "check_out_date"
    t.bigint "user_id", null: false
    t.bigint "appliance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appliance_id"], name: "index_offers_on_appliance_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.float "rating"
    t.bigint "appliance_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appliance_id"], name: "index_reviews_on_appliance_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appliances", "users"
  add_foreign_key "favourite_lists", "users"
  add_foreign_key "favourites", "appliances"
  add_foreign_key "favourites", "favourite_lists"
  add_foreign_key "offers", "appliances"
  add_foreign_key "offers", "users"
  add_foreign_key "reviews", "appliances"
  add_foreign_key "reviews", "users"
end
