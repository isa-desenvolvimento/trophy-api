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
    t.string "name", null: false, unique: true
    t.integer "punctuation", null: false, unique: true
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "jti", default: "", null: false
    t.bigint "user_sums_id"

    t.index ["user_sums_id"], name: "index_user_on_user_sums_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "users_sums", charset: "utf8", force: :cascade do |t|
    t.integer "sum_coins", default: ""
    t.integer "sum_kill_by_monster", default: ""
    t.integer "sum_deaths", default: ""
    t.string "rank_coins", default: ""
    t.string "rank_deaths", default: ""
  end

  create_table "rank_monsters", charset: "utf8", force: :cascade do |t|
    t.bigint "monster_id"
    t.string "rank_kill_monster", default: ""
    t.bigint "user_sums_id"    

    t.index ["monster_id"], name: "index_rank_monsters_on_monster_id"
    t.index ["user_sums_id"], name: "index_rank_monsters_on_user_sums_id"
  end

  add_foreign_key "collected_coins", "users"
  add_foreign_key "deaths", "users"
  add_foreign_key "killed_monsters", "monsters"
  add_foreign_key "killed_monsters", "users"  
  add_foreign_key "rank_monsters", "users_sums"
  add_foreign_key "users", "users_sums"
end
