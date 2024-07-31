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

ActiveRecord::Schema[7.1].define(version: 2024_07_31_133504) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_vendors", force: :cascade do |t|
    t.bigint "vendor_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_vendors_on_item_id"
    t.index ["vendor_id"], name: "index_item_vendors_on_vendor_id"
  end

  create_table "items", force: :cascade do |t|
    t.text "name"
    t.integer "qty"
    t.boolean "is_active"
    t.text "additional_remark"
    t.text "description"
    t.string "item_code"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "purchase_order_items", force: :cascade do |t|
    t.integer "item_id"
    t.integer "qty"
    t.float "amount"
    t.bigint "purchase_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_order_id"], name: "index_purchase_order_items_on_purchase_order_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.string "order_number"
    t.integer "vendor_id"
    t.integer "status"
    t.integer "user_id"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "transaction_type"
    t.integer "perform_by"
    t.integer "vendor_id"
    t.integer "item_id"
    t.integer "qty"
    t.integer "user_id"
    t.integer "purchase_order_id"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "encrypted_password"
    t.bigint "role_id"
    t.boolean "is_active"
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active"
    t.string "email"
    t.string "phone"
    t.text "address"
    t.string "country"
    t.string "gstn"
    t.string "state"
    t.string "city"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
