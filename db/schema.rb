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

ActiveRecord::Schema.define(version: 2021_02_04_232646) do

  create_table "collected_coins", charset: "utf8", force: :cascade do |t|
    t.integer "value_coin"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_collected_coins_on_user_id"
  end

  create_table "deaths", charset: "utf8", force: :cascade do |t|
    t.timestamp "time_reg"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_deaths_on_user_id"
  end

  create_table "info_coins", charset: "utf8", force: :cascade do |t|
    t.integer "sum", default: 0
    t.bigint "trophies_id"
    t.index ["trophies_id"], name: "index_info_coins_on_trophies_id"
  end

  create_table "info_deaths", charset: "utf8", force: :cascade do |t|
    t.integer "sum", default: 0
    t.bigint "trophy_deaths_id"
    t.index ["trophy_deaths_id"], name: "index_info_deaths_on_trophy_deaths_id"
  end

  create_table "info_monsters", charset: "utf8", force: :cascade do |t|
    t.integer "sum", default: 0
    t.bigint "trophies_id"
    t.bigint "monsters_id"
    t.bigint "users_id"
    t.index ["monsters_id"], name: "index_info_monsters_on_monsters_id"
    t.index ["trophies_id"], name: "index_info_monsters_on_trophies_id"
    t.index ["users_id"], name: "index_info_monsters_on_users_id"
  end

  create_table "killed_monsters", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "monster_id"
    t.index ["monster_id"], name: "index_killed_monsters_on_monster_id"
    t.index ["user_id"], name: "index_killed_monsters_on_user_id"
  end

  create_table "monsters", charset: "utf8", force: :cascade do |t|
    t.string "name"
  end

  create_table "trophies", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.integer "punctuation"
  end

  create_table "trophy_deaths", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.integer "punctuation"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.integer "info_coins_id", default: 0
    t.integer "info_deaths_id", default: 0
    t.integer "info_monsters_id", default: 0
    t.string "jti", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "collected_coins", "users"
  add_foreign_key "deaths", "users"
  add_foreign_key "info_coins", "trophies", column: "trophies_id"
  add_foreign_key "info_deaths", "trophy_deaths", column: "trophy_deaths_id"
  add_foreign_key "info_monsters", "monsters", column: "monsters_id"
  add_foreign_key "info_monsters", "trophies", column: "trophies_id"
  add_foreign_key "info_monsters", "users", column: "users_id"
  add_foreign_key "killed_monsters", "monsters"
  add_foreign_key "killed_monsters", "users"
end
