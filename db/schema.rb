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

ActiveRecord::Schema.define(version: 2020_03_30_113423) do

  create_table "comments", force: :cascade do |t|
    t.string "name"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "post_id"
    t.integer "user_id"
  end

  create_table "deals", force: :cascade do |t|
    t.integer "creator_id", null: false
    t.integer "collector_id", null: false
    t.integer "post_id", null: false
    t.boolean "creator_rating", default: false, null: false
    t.boolean "collector_rating", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collector_id"], name: "index_deals_on_collector_id"
    t.index ["creator_id"], name: "index_deals_on_creator_id"
    t.index ["post_id"], name: "index_deals_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "service_type"
    t.string "spot_name"
    t.string "address"
    t.integer "fee"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text "description"
    t.string "contact_name"
    t.string "contactno"
    t.string "contact_email"
    t.integer "constraint"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_collected", default: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "superadmin_role", default: false
    t.boolean "supervisor_role", default: false
    t.boolean "user_role", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "deals", "posts"
  add_foreign_key "posts", "users"
end
