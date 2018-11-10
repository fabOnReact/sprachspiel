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

ActiveRecord::Schema.define(version: 20181110160211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alliances", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "event_id"
    t.index ["event_id"], name: "index_categories_on_event_id", using: :btree
  end

  create_table "chatrooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "descriptions", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "building_id"
    t.integer  "product_id"
    t.index ["product_id"], name: "index_descriptions_on_product_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.integer  "chatroom_id"
    t.index ["chatroom_id"], name: "index_events_on_chatroom_id", using: :btree
  end

  create_table "events_users", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.index ["event_id"], name: "index_events_users_on_event_id", using: :btree
    t.index ["user_id"], name: "index_events_users_on_user_id", using: :btree
  end

  create_table "fights", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "alliance_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["alliance_id"], name: "index_invites_on_alliance_id", using: :btree
    t.index ["user_id"], name: "index_invites_on_user_id", using: :btree
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
    t.boolean  "selfmade"
    t.integer  "user_id"
    t.integer  "events_id"
    t.integer  "property_id"
    t.index ["events_id"], name: "index_items_on_events_id", using: :btree
    t.index ["property_id"], name: "index_items_on_property_id", using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "chatroom_id"
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
    t.integer  "requirement_id"
    t.boolean  "bonus"
    t.integer  "category_id"
    t.integer  "price"
    t.text     "description"
    t.integer  "property_id"
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["property_id"], name: "index_products_on_property_id", using: :btree
  end

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "event_id"
    t.index ["event_id"], name: "index_properties_on_event_id", using: :btree
    t.index ["name", "amount"], name: "index_properties_on_name_and_amount", unique: true, using: :btree
  end

  create_table "purchases", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.boolean  "selfmade"
    t.datetime "end_date"
    t.integer  "price"
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

  create_table "trades", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "admin"
    t.string   "username"
    t.integer  "role_id"
    t.integer  "chatrooms_id"
    t.integer  "money",                  default: 100
    t.integer  "health",                 default: 100
    t.integer  "defence",                default: 100
    t.integer  "attack",                 default: 100
    t.integer  "energy",                 default: 100
    t.integer  "alliance_id"
    t.index ["alliance_id"], name: "index_users_on_alliance_id", using: :btree
    t.index ["chatrooms_id"], name: "index_users_on_chatrooms_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "categories", "events"
  add_foreign_key "descriptions", "products"
  add_foreign_key "events", "chatrooms"
  add_foreign_key "invites", "alliances"
  add_foreign_key "invites", "users"
  add_foreign_key "items", "events", column: "events_id"
  add_foreign_key "items", "properties"
  add_foreign_key "items", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "properties"
  add_foreign_key "properties", "events"
  add_foreign_key "users", "alliances"
  add_foreign_key "users", "chatrooms", column: "chatrooms_id"
end
