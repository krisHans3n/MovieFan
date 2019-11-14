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

ActiveRecord::Schema.define(version: 2019_11_14_202353) do

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
    t.string "genre"
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
    t.string "actor1"
    t.string "actor2"
    t.string "keywords"
    t.string "language"
    t.string "contentrating"
    t.index ["countries_id"], name: "index_movies_on_countries_id"
  end

  add_foreign_key "movies", "countries", column: "countries_id"
end
