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

ActiveRecord::Schema.define(version: 20140923041047) do

  create_table "advocates", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "active"
    t.string   "logo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "payment_plan_id"
    t.date     "payment_due_date"
    t.string   "stripe_customer_id"
  end

  create_table "offer_shares", force: true do |t|
    t.integer  "offer_id"
    t.integer  "advocate_id"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offer_shares", ["advocate_id"], name: "index_offer_shares_on_advocate_id"
  add_index "offer_shares", ["offer_id"], name: "index_offer_shares_on_offer_id"

  create_table "offers", force: true do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.string   "description"
    t.string   "reward_description"
    t.string   "reward_factor"
    t.string   "redemption_value"
    t.string   "image_url"
    t.date     "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offers", ["customer_id"], name: "index_offers_on_customer_id"

  create_table "payment_plans", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "amount"
    t.string   "billing_period"
    t.string   "stripe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.integer  "customer_id"
    t.integer  "payment_plan_id"
    t.integer  "amount"
    t.string   "auth_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "due_date"
  end

  add_index "payments", ["customer_id"], name: "index_payments_on_customer_id"
  add_index "payments", ["payment_plan_id"], name: "index_payments_on_payment_plan_id"

  create_table "redemptions", force: true do |t|
    t.integer  "offer_share_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redemptions", ["offer_share_id"], name: "index_redemptions_on_offer_share_id"

  create_table "rewards", force: true do |t|
    t.integer  "offer_share_id"
    t.datetime "rewarded_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rewards", ["offer_share_id"], name: "index_rewards_on_offer_share_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
