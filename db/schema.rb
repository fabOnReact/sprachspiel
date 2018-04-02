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

ActiveRecord::Schema.define(version: 20180402151118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string   "name"
    t.integer  "price_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.integer  "role_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chatrooms", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "room_id"
    t.integer  "building_id"
  end

  create_table "descriptions", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "building_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "purchase_id"
    t.integer  "sale_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "product_id"
    t.boolean  "sold"
    t.boolean  "used"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "purchase_id"
    t.integer  "sale_id"
    t.integer  "room_id"
    t.boolean  "selfmade"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "chatroom_id"
  end

  create_table "plutus_accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.boolean  "contra"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tenant_id"
    t.index ["name", "type"], name: "index_plutus_accounts_on_name_and_type", using: :btree
  end

  create_table "plutus_amounts", force: :cascade do |t|
    t.string  "type"
    t.integer "account_id"
    t.integer "entry_id"
    t.decimal "amount",     precision: 20, scale: 10
    t.integer "quantity"
    t.index ["account_id", "entry_id"], name: "index_plutus_amounts_on_account_id_and_entry_id", using: :btree
    t.index ["entry_id", "account_id"], name: "index_plutus_amounts_on_entry_id_and_account_id", using: :btree
    t.index ["type"], name: "index_plutus_amounts_on_type", using: :btree
  end

  create_table "plutus_entries", force: :cascade do |t|
    t.string   "description"
    t.date     "date"
    t.integer  "commercial_document_id"
    t.string   "commercial_document_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["commercial_document_id", "commercial_document_type"], name: "index_entries_on_commercial_doc", using: :btree
    t.index ["date"], name: "index_plutus_entries_on_date", using: :btree
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "gold"
    t.integer  "wood"
    t.integer  "food"
    t.integer  "stone"
    t.integer  "metal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "building_id"
    t.integer  "requirement_id"
    t.boolean  "bonus"
    t.integer  "category_id"
    t.integer  "price"
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
  end

  create_table "purchases", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "invoice_id"
    t.integer  "room_id"
    t.integer  "price_id"
    t.integer  "user_id"
    t.integer  "sale_id"
    t.boolean  "selfmade"
    t.integer  "amount"
    t.datetime "end_date"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "building_id"
    t.integer  "user_id"
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "invoice_id"
    t.integer  "room_id"
    t.integer  "price_id"
    t.integer  "user_id"
    t.integer  "purchase_id"
    t.integer  "amount"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.string   "username"
    t.integer  "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "items", "users"
  add_foreign_key "products", "categories"
end
