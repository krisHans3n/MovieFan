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

ActiveRecord::Schema.define(version: 2019_11_11_184826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "Ctrycode"
    t.decimal "Lat"
    t.decimal "Long"
    t.string "Country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "links", force: :cascade do |t|
    t.integer "mId"
    t.integer "imdbId"
    t.integer "tmdId"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "Title"
    t.string "Director"
    t.decimal "Duration"
    t.string "Genre"
    t.integer "Year"
    t.decimal "imdbscore"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "productioncountry"
    t.bigint "countries_id"
    t.bigint "title_list9000s_id"
    t.index ["countries_id"], name: "index_movies_on_countries_id"
    t.index ["title_list9000s_id"], name: "index_movies_on_title_list9000s_id"
  end

  create_table "tags", force: :cascade do |t|
    t.integer "movieIDk"
    t.string "tags"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "title_list9000s", force: :cascade do |t|
    t.integer "movieId"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "movies", "countries", column: "countries_id"
  add_foreign_key "movies", "title_list9000s", column: "title_list9000s_id"
end
