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

ActiveRecord::Schema.define(version: 2019_11_28_011627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "postcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id"
    t.index ["users_id"], name: "index_addresses_on_users_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "Ctrycode"
    t.decimal "Lat"
    t.decimal "Long"
    t.string "Country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "creditcards", force: :cascade do |t|
    t.integer "number"
    t.string "expdate"
    t.string "nameoncard"
    t.string "organisationtype"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id"
    t.index ["users_id"], name: "index_creditcards_on_users_id"
  end

  create_table "lineitems", force: :cascade do |t|
    t.bigint "merchandises_id", null: false
    t.bigint "carts_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity", default: 1
    t.index ["carts_id"], name: "index_lineitems_on_carts_id"
    t.index ["merchandises_id"], name: "index_lineitems_on_merchandises_id"
  end

  create_table "merchandises", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.string "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "stocknumber"
  end

  create_table "merchorders", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "merchandises_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id"
    t.index ["merchandises_id"], name: "index_merchorders_on_merchandises_id"
    t.index ["users_id"], name: "index_merchorders_on_users_id"
  end

  create_table "merchpayments", force: :cascade do |t|
    t.bigint "merchorders_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "total"
    t.index ["merchorders_id"], name: "index_merchpayments_on_merchorders_id"
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
    t.bigint "users_id"
    t.index ["movies_id"], name: "index_movieswatcheds_on_movies_id"
    t.index ["users_id"], name: "index_movieswatcheds_on_users_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status"
    t.decimal "totalprice"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subscriptionpayments", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "subscription_level"
    t.decimal "price"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "f_name"
    t.string "l_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "addresses", "users", column: "users_id"
  add_foreign_key "creditcards", "users", column: "users_id"
  add_foreign_key "lineitems", "carts", column: "carts_id"
  add_foreign_key "lineitems", "merchandises", column: "merchandises_id"
  add_foreign_key "merchorders", "merchandises", column: "merchandises_id"
  add_foreign_key "merchorders", "users", column: "users_id"
  add_foreign_key "merchpayments", "merchorders", column: "merchorders_id"
  add_foreign_key "movies", "countries", column: "countries_id"
  add_foreign_key "movies", "merchandises", column: "merchandises_id"
  add_foreign_key "movieswatcheds", "users", column: "users_id"
end
