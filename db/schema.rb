# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_31_034005) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "gig_users", force: :cascade do |t|
    t.integer "gig_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "Pending"
    t.float "pay"
    t.index ["gig_id"], name: "index_gig_users_on_gig_id"
    t.index ["user_id"], name: "index_gig_users_on_user_id"
  end

  create_table "gigs", force: :cascade do |t|
    t.text "production_schedule"
    t.text "guest_list"
    t.string "event_type"
    t.string "booking_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "street_address"
    t.string "secondary_address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "client"
    t.string "title"
  end

  create_table "invoices", force: :cascade do |t|
    t.datetime "date"
    t.float "amount"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "gig_id"
    t.index ["gig_id"], name: "index_invoices_on_gig_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "set_lists", force: :cascade do |t|
    t.integer "gig_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["gig_id"], name: "index_set_lists_on_gig_id"
  end

  create_table "setlist_songs", force: :cascade do |t|
    t.integer "set_list_id"
    t.integer "song_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["set_list_id"], name: "index_setlist_songs_on_set_list_id"
    t.index ["song_id"], name: "index_setlist_songs_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "artist"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "instrument"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
