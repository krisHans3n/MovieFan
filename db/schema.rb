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

ActiveRecord::Schema.define(version: 2019_11_16_122256) do

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

  create_table "merchandises", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.string "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "merchorders", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "merchandises_id", null: false
    t.bigint "orders_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["merchandises_id"], name: "index_merchorders_on_merchandises_id"
    t.index ["orders_id"], name: "index_merchorders_on_orders_id"
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
    t.bigint "merchandises_id"
    t.index ["countries_id"], name: "index_movies_on_countries_id"
    t.index ["merchandises_id"], name: "index_movies_on_merchandises_id"
  end

  create_table "movieswatcheds", force: :cascade do |t|
    t.bigint "movies_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movies_id"], name: "index_movieswatcheds_on_movies_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status"
    t.decimal "totalprice"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "merchandises_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["merchandises_id"], name: "index_stocks_on_merchandises_id"
  end

  create_table "subplans", force: :cascade do |t|
    t.string "plantype"
    t.boolean "recurring"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "f_name"
    t.string "l_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "merchorders", "merchandises", column: "merchandises_id"
  add_foreign_key "merchorders", "orders", column: "orders_id"
  add_foreign_key "movies", "countries", column: "countries_id"
  add_foreign_key "movies", "merchandises", column: "merchandises_id"
end
