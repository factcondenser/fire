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

ActiveRecord::Schema.define(version: 2019_12_23_034622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expense_categories", force: :cascade do |t|
    t.string "name", limit: 63, null: false
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "parent_id"], name: "index_expense_categories_on_name_and_parent_id", unique: true
    t.index ["parent_id"], name: "index_expense_categories_on_parent_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "amount_cents", null: false
    t.string "description", limit: 255
    t.bigint "user_id", null: false
    t.bigint "expense_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expense_category_id"], name: "index_expenses_on_expense_category_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "income_categories", force: :cascade do |t|
    t.string "name", limit: 63, null: false
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "parent_id"], name: "index_income_categories_on_name_and_parent_id", unique: true
    t.index ["parent_id"], name: "index_income_categories_on_parent_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.bigint "amount_cents", null: false
    t.string "description", limit: 255
    t.bigint "user_id", null: false
    t.bigint "income_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["income_category_id"], name: "index_incomes_on_income_category_id"
    t.index ["user_id"], name: "index_incomes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "auth_token"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "expense_categories", "expense_categories", column: "parent_id"
  add_foreign_key "expenses", "expense_categories"
  add_foreign_key "expenses", "users"
  add_foreign_key "income_categories", "income_categories", column: "parent_id"
  add_foreign_key "incomes", "income_categories"
  add_foreign_key "incomes", "users"
end
