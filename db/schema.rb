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

ActiveRecord::Schema[7.1].define(version: 2025_03_21_025234) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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

  create_table "booking_lists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_booking_lists_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "appliance_id", null: false
    t.bigint "booking_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "check_in_date"
    t.string "check_out_date"
    t.float "total_price"
    t.index ["appliance_id"], name: "index_bookings_on_appliance_id"
    t.index ["booking_list_id"], name: "index_bookings_on_booking_list_id"
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

  create_table "offer_lists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_offer_lists_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "appliance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "offer_list_id", null: false
    t.index ["appliance_id"], name: "index_offers_on_appliance_id"
    t.index ["offer_list_id"], name: "index_offers_on_offer_list_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "bio"
    t.string "location"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appliances", "users"
  add_foreign_key "booking_lists", "users"
  add_foreign_key "bookings", "appliances"
  add_foreign_key "bookings", "booking_lists"
  add_foreign_key "favourite_lists", "users"
  add_foreign_key "favourites", "appliances"
  add_foreign_key "favourites", "favourite_lists"
  add_foreign_key "offer_lists", "users"
  add_foreign_key "offers", "appliances"
  add_foreign_key "offers", "offer_lists"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "appliances"
  add_foreign_key "reviews", "users"
end
