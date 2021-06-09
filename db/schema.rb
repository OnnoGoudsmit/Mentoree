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

ActiveRecord::Schema.define(version: 2021_06_09_091338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advice_preferences", force: :cascade do |t|
    t.bigint "industry_id", null: false
    t.string "subject"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["industry_id"], name: "index_advice_preferences_on_industry_id"
    t.index ["user_id"], name: "index_advice_preferences_on_user_id"
  end

  create_table "availabilities", force: :cascade do |t|
    t.bigint "mentor_id"
    t.datetime "slot"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mentor_id"], name: "index_availabilities_on_mentor_id"
  end

  create_table "industries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.text "prep_content"
    t.bigint "mentor_id"
    t.bigint "mentoree_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "availability_id"
    t.index ["availability_id"], name: "index_meetings_on_availability_id"
    t.index ["mentor_id"], name: "index_meetings_on_mentor_id"
    t.index ["mentoree_id"], name: "index_meetings_on_mentoree_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "meeting_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meeting_id"], name: "index_reviews_on_meeting_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "city"
    t.string "phone_number"
    t.text "about"
    t.text "resume"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "advice_preferences", "industries"
  add_foreign_key "advice_preferences", "users"
  add_foreign_key "availabilities", "users", column: "mentor_id"
  add_foreign_key "meetings", "availabilities"
  add_foreign_key "meetings", "users", column: "mentor_id"
  add_foreign_key "meetings", "users", column: "mentoree_id"
  add_foreign_key "reviews", "meetings"
end
