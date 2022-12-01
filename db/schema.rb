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

ActiveRecord::Schema[7.0].define(version: 2022_11_30_212045) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charging_sessions", force: :cascade do |t|
    t.integer "count_of_power", null: false
    t.bigint "connector_id"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_charging_sessions_on_client_id"
    t.index ["connector_id"], name: "index_charging_sessions_on_connector_id"
  end

  create_table "charging_stations", force: :cascade do |t|
    t.integer "serial_number", null: false
    t.bigint "point_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["point_id"], name: "index_charging_stations_on_point_id"
  end

  create_table "clients", force: :cascade do |t|
    t.integer "phone_number", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "connectors", force: :cascade do |t|
    t.string "type", null: false
    t.string "condition", default: "free"
    t.integer "power", null: false
    t.bigint "charging_station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charging_station_id"], name: "index_connectors_on_charging_station_id"
  end

  create_table "points", force: :cascade do |t|
    t.string "title", null: false
    t.integer "latitude", null: false
    t.integer "longitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "charging_sessions", "clients"
  add_foreign_key "charging_sessions", "connectors"
  add_foreign_key "charging_stations", "points"
  add_foreign_key "connectors", "charging_stations"
end
