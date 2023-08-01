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

ActiveRecord::Schema[7.0].define(version: 2023_08_01_151257) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_options", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.bigint "boat_model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_model_id"], name: "index_additional_options_on_boat_model_id"
  end

  create_table "aluminum_options", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.bigint "boat_model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_model_id"], name: "index_aluminum_options_on_boat_model_id"
  end

  create_table "boat_model_options", force: :cascade do |t|
    t.bigint "boat_model_id", null: false
    t.bigint "option_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_model_id"], name: "index_boat_model_options_on_boat_model_id"
    t.index ["option_id"], name: "index_boat_model_options_on_option_id"
  end

  create_table "boat_models", force: :cascade do |t|
    t.string "length"
    t.string "beam"
    t.integer "max_hp"
    t.integer "hull_weight"
    t.integer "max_passengers"
    t.decimal "price_hull"
    t.decimal "price_trailer_hull"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "stock_number"
    t.string "style"
    t.integer "year"
  end

  create_table "console_options", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.bigint "boat_model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_model_id"], name: "index_console_options_on_boat_model_id"
  end

  create_table "cooler_options", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.bigint "boat_model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_model_id"], name: "index_cooler_options_on_boat_model_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.date "date_contacted"
    t.string "location"
    t.text "notes"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "estimate_options", force: :cascade do |t|
    t.bigint "estimate_id", null: false
    t.bigint "option_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estimate_id"], name: "index_estimate_options_on_estimate_id"
    t.index ["option_id"], name: "index_estimate_options_on_option_id"
  end

  create_table "estimates", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "boat_model_id", null: false
    t.decimal "subtotal"
    t.decimal "tax"
    t.decimal "vit"
    t.decimal "doc_fee"
    t.decimal "registration"
    t.decimal "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.index ["boat_model_id"], name: "index_estimates_on_boat_model_id"
    t.index ["user_id"], name: "index_estimates_on_user_id"
  end

  create_table "factory_options", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.bigint "boat_model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_model_id"], name: "index_factory_options_on_boat_model_id"
  end

  create_table "finishing_options", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.bigint "boat_model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_model_id"], name: "index_finishing_options_on_boat_model_id"
  end

  create_table "gauge_upgrades", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.bigint "boat_model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_model_id"], name: "index_gauge_upgrades_on_boat_model_id"
  end

  create_table "lighting_options", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.bigint "boat_model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_model_id"], name: "index_lighting_options_on_boat_model_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.string "option_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "power_options", force: :cascade do |t|
    t.string "model_number"
    t.text "description"
    t.decimal "price"
    t.string "engine_model"
    t.string "engine_make"
    t.integer "year"
    t.string "serial_number"
    t.bigint "boat_model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brand"
    t.index ["boat_model_id"], name: "index_power_options_on_boat_model_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "seating_options", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.bigint "boat_model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_model_id"], name: "index_seating_options_on_boat_model_id"
  end

  create_table "standard_features", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.bigint "boat_model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_model_id"], name: "index_standard_features_on_boat_model_id"
  end

  create_table "trailer_upgrades", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.bigint "boat_model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_model_id"], name: "index_trailer_upgrades_on_boat_model_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "wetsound_packages", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.bigint "boat_model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_model_id"], name: "index_wetsound_packages_on_boat_model_id"
  end

  add_foreign_key "additional_options", "boat_models"
  add_foreign_key "aluminum_options", "boat_models"
  add_foreign_key "boat_model_options", "boat_models"
  add_foreign_key "boat_model_options", "options"
  add_foreign_key "console_options", "boat_models"
  add_foreign_key "cooler_options", "boat_models"
  add_foreign_key "customers", "users"
  add_foreign_key "estimate_options", "estimates"
  add_foreign_key "estimate_options", "options"
  add_foreign_key "estimates", "boat_models"
  add_foreign_key "estimates", "users"
  add_foreign_key "factory_options", "boat_models"
  add_foreign_key "finishing_options", "boat_models"
  add_foreign_key "gauge_upgrades", "boat_models"
  add_foreign_key "lighting_options", "boat_models"
  add_foreign_key "power_options", "boat_models"
  add_foreign_key "seating_options", "boat_models"
  add_foreign_key "standard_features", "boat_models"
  add_foreign_key "trailer_upgrades", "boat_models"
  add_foreign_key "wetsound_packages", "boat_models"
end
