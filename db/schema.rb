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

ActiveRecord::Schema.define(version: 2021_08_29_173653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boba_shops", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "drive_thru"
    t.integer "capacity"
  end

  create_table "drinks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "in_stock"
    t.decimal "price"
    t.bigint "boba_shop_id"
    t.index ["boba_shop_id"], name: "index_drinks_on_boba_shop_id"
  end

  create_table "pastas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "is_vegan"
    t.decimal "price"
    t.bigint "restaurant_id"
    t.index ["restaurant_id"], name: "index_pastas_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "delivery"
    t.integer "michelin_stars"
  end

  add_foreign_key "drinks", "boba_shops"
  add_foreign_key "pastas", "restaurants"
end
