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

ActiveRecord::Schema.define(version: 20171012004547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friends_members", id: false, force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "friend_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id", "member_id"], name: "index_friends_members_on_friend_id_and_member_id"
    t.index ["member_id", "friend_id"], name: "index_friends_members_on_member_id_and_friend_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name", null: false
    t.string "website", null: false
    t.string "short_url", default: "", null: false
    t.text "scraped_content", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
