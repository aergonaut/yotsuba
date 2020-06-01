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

ActiveRecord::Schema.define(version: 2020_05_31_220425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "furnitures", force: :cascade do |t|
    t.string "type", null: false
    t.string "name", null: false
    t.boolean "diy", default: false, null: false
    t.boolean "catalog", default: false, null: false
    t.string "source_notes"
    t.string "series"
    t.string "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["type"], name: "index_furnitures_on_type"
  end

  create_table "islands", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_islands_on_user_id"
  end

  create_table "turnip_markets", force: :cascade do |t|
    t.bigint "island_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["island_id"], name: "index_turnip_markets_on_island_id"
  end

  create_table "turnip_valuations", force: :cascade do |t|
    t.bigint "turnip_market_id"
    t.integer "price", null: false
    t.integer "period", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["turnip_market_id"], name: "index_turnip_valuations_on_turnip_market_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "username", null: false
    t.string "password_digest", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "variants", force: :cascade do |t|
    t.string "image_url"
    t.string "filename"
    t.string "variation"
    t.string "variant_id"
    t.string "unique_entry_id"
    t.integer "buy"
    t.integer "sell"
    t.string "sources", array: true
    t.string "colors", array: true
    t.string "item_type"
    t.bigint "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_type", "item_id"], name: "index_variants_on_item_type_and_item_id"
  end

end
