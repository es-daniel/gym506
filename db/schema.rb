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

ActiveRecord::Schema.define(version: 2019_12_01_201455) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.integer "maximum_capacity"
    t.integer "enrolled"
    t.datetime "deleted_at"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "gym_services", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "preferred_days", force: :cascade do |t|
    t.string "day"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "preferred_schedules", force: :cascade do |t|
    t.string "schedule"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_exercises", force: :cascade do |t|
    t.bigint "preferred_day_id", null: false
    t.bigint "user_id", null: false
    t.string "name"
    t.string "repetitions"
    t.integer "series"
    t.string "user_rest"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["preferred_day_id"], name: "index_user_exercises_on_preferred_day_id"
    t.index ["user_id"], name: "index_user_exercises_on_user_id"
  end

  create_table "user_preferred_days", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "preferred_day_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["preferred_day_id"], name: "index_user_preferred_days_on_preferred_day_id"
    t.index ["user_id"], name: "index_user_preferred_days_on_user_id"
  end

  create_table "user_preferred_schedules", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "preferred_schedule_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["preferred_schedule_id"], name: "index_user_preferred_schedules_on_preferred_schedule_id"
    t.index ["user_id"], name: "index_user_preferred_schedules_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.integer "identification"
    t.datetime "birthday"
    t.string "email"
    t.integer "phone_number"
    t.string "address"
    t.float "weight"
    t.float "height"
    t.integer "gender"
    t.float "imc"
    t.string "objectives"
    t.string "position"
    t.integer "role", default: 2
    t.integer "status"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "user_exercises", "preferred_days"
  add_foreign_key "user_exercises", "users"
  add_foreign_key "user_preferred_days", "preferred_days"
  add_foreign_key "user_preferred_days", "users"
  add_foreign_key "user_preferred_schedules", "preferred_schedules"
  add_foreign_key "user_preferred_schedules", "users"
end
