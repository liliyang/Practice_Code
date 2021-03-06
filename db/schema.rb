# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140802175404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "category"
    t.string   "picture"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  create_table "characters", force: true do |t|
    t.string   "name"
    t.string   "pronunciation"
    t.string   "character_type"
    t.string   "rank"
    t.integer  "age"
    t.string   "gender"
    t.string   "location"
    t.text     "description"
    t.text     "personality"
    t.text     "history"
    t.integer  "pet_count",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "craft"
    t.integer  "user_id"
    t.boolean  "approved",          default: false
    t.boolean  "active",            default: true
    t.string   "picture"
    t.string   "preference"
    t.text     "abilities"
    t.string   "dragon_preference"
    t.string   "dragon_names"
    t.string   "craft_rank"
    t.string   "craft_specialty"
    t.text     "craft_abilities"
    t.string   "hold"
    t.string   "hold_size"
    t.string   "category"
  end

  add_index "characters", ["user_id"], name: "index_characters_on_user_id", using: :btree

  create_table "clutches", force: true do |t|
    t.string   "dame"
    t.string   "sire"
    t.date     "date_clutched"
    t.date     "date_hatched"
    t.string   "theme"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",      default: false
    t.string   "creature_type"
    t.string   "dame_color"
    t.string   "sire_color"
  end

  add_index "clutches", ["user_id"], name: "index_clutches_on_user_id", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "dragons", force: true do |t|
    t.integer  "rider_id"
    t.string   "name"
    t.string   "color"
    t.integer  "age"
    t.text     "description"
    t.text     "personality"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "wing"
    t.string   "size"
    t.text     "abilities"
  end

  add_index "dragons", ["rider_id"], name: "index_dragons_on_rider_id", using: :btree

  create_table "eggs", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "creature_color"
    t.text     "creature_appearance"
    t.text     "creature_personality"
    t.string   "character"
    t.string   "inspiration"
    t.integer  "clutch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
    t.string   "creature_name"
  end

  add_index "eggs", ["clutch_id"], name: "index_eggs_on_clutch_id", using: :btree
  add_index "eggs", ["post_id"], name: "index_eggs_on_post_id", using: :btree

  create_table "pets", force: true do |t|
    t.integer  "character_id"
    t.string   "name"
    t.string   "pet_type"
    t.text     "description"
    t.text     "personality"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pets", ["character_id"], name: "index_pets_on_character_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "post_body"
    t.boolean  "reveal"
    t.integer  "clutch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["clutch_id"], name: "index_posts_on_clutch_id", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "character_id"
    t.integer  "relative_id"
    t.string   "relation_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.integer  "age"
    t.string   "messenger"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
