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

ActiveRecord::Schema[7.0].define(version: 2022_03_07_175230) do
  create_table "expected_expenses", force: :cascade do |t|
    t.string "title"
    t.string "amount"
    t.integer "future_month_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["future_month_id"], name: "index_expected_expenses_on_future_month_id"
  end

  create_table "expected_incomes", force: :cascade do |t|
    t.string "title"
    t.string "amount"
    t.string "earner"
    t.integer "future_month_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["future_month_id"], name: "index_expected_incomes_on_future_month_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "title"
    t.string "amount"
    t.integer "month_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["month_id"], name: "index_expenses_on_month_id"
  end

  create_table "future_months", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "incomes", force: :cascade do |t|
    t.string "title"
    t.string "amount"
    t.string "earner"
    t.integer "month_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["month_id"], name: "index_incomes_on_month_id"
  end

  create_table "months", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  add_foreign_key "expected_expenses", "future_months"
  add_foreign_key "expected_incomes", "future_months"
  add_foreign_key "expenses", "months"
  add_foreign_key "incomes", "months"
end
