# encoding: UTF-8
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


ActiveRecord::Schema.define(version: 20150802122539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.time     "start_hour"
    t.time     "end_hour"
    t.integer  "bricooler_id"
    t.integer  "booking_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "availabilities", ["booking_id"], name: "index_availabilities_on_booking_id", using: :btree
  add_index "availabilities", ["bricooler_id"], name: "index_availabilities_on_bricooler_id", using: :btree

  create_table "bookings", force: true do |t|
    t.date     "day"
    t.time     "hour"
    t.integer  "service_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bookings", ["customer_id"], name: "index_bookings_on_customer_id", using: :btree
  add_index "bookings", ["service_id"], name: "index_bookings_on_service_id", using: :btree

  create_table "bricoolers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "zipcode"
    t.string   "city"
    t.string   "picture"
    t.text     "bio"
    t.boolean  "identity_verified"
    t.boolean  "licence_verified"
    t.boolean  "phone_verified"
    t.boolean  "email_verified"
    t.string   "iban"
    t.string   "bic"
    t.boolean  "tsandcs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.integer  "price"
    t.integer  "bricooler_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["bricooler_id"], name: "index_services_on_bricooler_id", using: :btree

  create_table "users", force: true do |t|
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
    t.integer  "profileable_id"
    t.string   "profileable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["profileable_id", "profileable_type"], name: "index_users_on_profileable_id_and_profileable_type", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
