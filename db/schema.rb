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

ActiveRecord::Schema.define(version: 20180308202135) do

  create_table "anime_genres", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anime_id"], name: "index_anime_genres_on_anime_id"
    t.index ["genre_id"], name: "index_anime_genres_on_genre_id"
  end

  create_table "anime_producers", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "producer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anime_id"], name: "index_anime_producers_on_anime_id"
    t.index ["producer_id"], name: "index_anime_producers_on_producer_id"
  end

  create_table "animes", force: :cascade do |t|
    t.integer "mal_id"
    t.string "name"
    t.integer "episode_count"
    t.decimal "rating"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "producer_id"
    t.index ["producer_id"], name: "index_employees_on_producer_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "producers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
