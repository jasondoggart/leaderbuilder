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

ActiveRecord::Schema.define(version: 20180430223450) do

  create_table "apprentice_relationships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id"
    t.integer "apprentice_id"
    t.index ["role_id"], name: "index_apprentice_relationships_on_role_id"
  end

  create_table "ministries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "director_id"
  end

  create_table "role_relationships", force: :cascade do |t|
    t.integer "leading_role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "following_role_id"
    t.index ["following_role_id"], name: "index_role_relationships_on_following_role_id"
    t.index ["leading_role_id"], name: "index_role_relationships_on_leading_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "role_type"
    t.integer "team_member_id"
    t.integer "ministry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.datetime "set_inactive_at"
    t.index ["ministry_id"], name: "index_roles_on_ministry_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "pc_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
