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

ActiveRecord::Schema.define(version: 20170928135130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conferences", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "url", null: false
    t.string "image_uri"
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.bigint "location_id", null: false
    t.bigint "organizer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.text "address"
    t.string "city", null: false
    t.string "state", limit: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "talks", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "topic", null: false
    t.bigint "speaker_id", null: false
    t.bigint "conference_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_talks_on_title"
    t.index ["topic"], name: "index_talks_on_topic"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "twitter_username"
    t.string "image_uri"
    t.text "bio", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
