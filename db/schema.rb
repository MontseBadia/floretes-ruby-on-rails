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

ActiveRecord::Schema.define(version: 20180921085308) do

  create_table "cart_flowers", force: :cascade do |t|
    t.integer  "flower_id"
    t.integer  "cart_pot_id"
    t.integer  "units"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["cart_pot_id"], name: "index_cart_flowers_on_cart_pot_id"
    t.index ["flower_id"], name: "index_cart_flowers_on_flower_id"
  end

  create_table "cart_pots", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "pot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_pots_on_cart_id"
    t.index ["pot_id"], name: "index_cart_pots_on_pot_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "flowers", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.string   "origin"
    t.decimal  "price"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "image",      default: "flower_base.png"
  end

  create_table "order_flowers", force: :cascade do |t|
    t.integer  "order_pot_id"
    t.integer  "flower_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "units",        default: 0
    t.index ["flower_id"], name: "index_order_flowers_on_flower_id"
    t.index ["order_pot_id"], name: "index_order_flowers_on_order_pot_id"
  end

  create_table "order_pots", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "pot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_pots_on_order_id"
    t.index ["pot_id"], name: "index_order_pots_on_pot_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "address"
    t.string   "phone"
    t.decimal  "total_price"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pots", force: :cascade do |t|
    t.string   "name"
    t.string   "dimensions"
    t.string   "material"
    t.decimal  "price"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "image",      default: "pot_base.png"
    t.integer  "capacity"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
  end

end
