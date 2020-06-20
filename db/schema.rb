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

ActiveRecord::Schema.define(version: 2020_06_20_071857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "quantity", default: 1
    t.bigint "item_id", null: false
    t.bigint "cart_id"
    t.bigint "user_id"
    t.bigint "shop_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["item_id"], name: "index_cart_items_on_item_id"
    t.index ["order_id"], name: "index_cart_items_on_order_id"
    t.index ["shop_id"], name: "index_cart_items_on_shop_id"
    t.index ["user_id"], name: "index_cart_items_on_user_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorizings", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categorizings_on_category_id"
    t.index ["item_id"], name: "index_categorizings_on_item_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "shop_owner_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shop_id"
    t.bigint "post_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["shop_id"], name: "index_comments_on_shop_id"
    t.index ["shop_owner_id"], name: "index_comments_on_shop_owner_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "delivery_addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "delivery_name", null: false
    t.integer "postcode", null: false
    t.integer "prefecture_code", null: false
    t.string "address_city", null: false
    t.string "address_street", null: false
    t.string "address_building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_delivery_addresses_on_user_id"
  end

  create_table "favorite_shops", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_favorite_shops_on_shop_id"
    t.index ["user_id"], name: "index_favorite_shops_on_user_id"
  end

  create_table "itemizes", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_itemizes_on_item_id"
    t.index ["shop_id"], name: "index_itemizes_on_shop_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "shop_id"
    t.bigint "category_id"
    t.string "name", null: false
    t.integer "price", null: false
    t.text "remark", null: false
    t.integer "stock", null: false
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["shop_id"], name: "index_items_on_shop_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "item_id"
    t.bigint "shop_id"
    t.integer "quantity"
    t.datetime "order_date"
    t.datetime "delivery_date"
    t.bigint "delivery_address_id"
    t.bigint "payment_method"
    t.integer "subtotal_price"
    t.integer "tax"
    t.integer "delivery_price", default: 350
    t.integer "tax_included_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.integer "address"
    t.index ["delivery_address_id"], name: "index_orders_on_delivery_address_id"
    t.index ["item_id"], name: "index_orders_on_item_id"
    t.index ["shop_id"], name: "index_orders_on_shop_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "shop_id"
    t.bigint "user_id"
    t.bigint "shop_owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_posts_on_shop_id"
    t.index ["shop_owner_id"], name: "index_posts_on_shop_owner_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "shop_owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone_number", null: false
    t.integer "postcode", null: false
    t.string "prefecture_code", null: false
    t.string "address_city", null: false
    t.string "address_street", null: false
    t.string "address_building"
    t.float "latitude"
    t.float "longitude"
    t.integer "number_of_store", null: false
    t.bigint "shop_id"
    t.bigint "category_id"
    t.string "image"
    t.string "address"
    t.index ["category_id"], name: "index_shop_owners_on_category_id"
    t.index ["confirmation_token"], name: "index_shop_owners_on_confirmation_token", unique: true
    t.index ["email"], name: "index_shop_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_shop_owners_on_reset_password_token", unique: true
    t.index ["shop_id"], name: "index_shop_owners_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.bigint "shop_owner_id"
    t.string "name", null: false
    t.text "introduction", null: false
    t.string "profile_image"
    t.string "image"
    t.string "phone_number", null: false
    t.integer "postcode", null: false
    t.string "prefecture_code", null: false
    t.string "address_city", null: false
    t.string "address_street", null: false
    t.string "address_building"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
    t.string "address"
    t.bigint "post_id"
    t.index ["post_id"], name: "index_shops_on_post_id"
    t.index ["shop_owner_id"], name: "index_shops_on_shop_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin", default: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone_number", null: false
    t.integer "postcode", null: false
    t.string "prefecture_code", null: false
    t.string "address_city", null: false
    t.string "address_street", null: false
    t.string "address_building"
    t.float "latitude"
    t.float "longitude"
    t.bigint "order_id"
    t.string "address"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["order_id"], name: "index_users_on_order_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "items"
  add_foreign_key "cart_items", "orders"
  add_foreign_key "cart_items", "shops"
  add_foreign_key "cart_items", "users"
  add_foreign_key "categorizings", "categories"
  add_foreign_key "categorizings", "items"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "shop_owners"
  add_foreign_key "comments", "shops"
  add_foreign_key "comments", "users"
  add_foreign_key "delivery_addresses", "users"
  add_foreign_key "favorite_shops", "shops"
  add_foreign_key "favorite_shops", "users"
  add_foreign_key "itemizes", "items"
  add_foreign_key "itemizes", "shops"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "shops"
  add_foreign_key "orders", "delivery_addresses"
  add_foreign_key "orders", "items"
  add_foreign_key "orders", "shops"
  add_foreign_key "orders", "users"
  add_foreign_key "posts", "shop_owners"
  add_foreign_key "posts", "shops"
  add_foreign_key "posts", "users"
  add_foreign_key "shop_owners", "categories"
  add_foreign_key "shop_owners", "shops"
  add_foreign_key "shops", "posts"
  add_foreign_key "shops", "shop_owners"
  add_foreign_key "users", "orders"
end
