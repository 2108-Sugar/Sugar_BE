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

ActiveRecord::Schema.define(version: 2022_02_04_224437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "communities", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "requests", force: :cascade do |t|
    t.string "name"
    t.string "details"
    t.string "type"
    t.integer "status"
    t.datetime "borrow_date"
    t.datetime "return_date"
    t.bigint "requested_by_id"
    t.bigint "lender_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "community_id", null: false
    t.index ["community_id"], name: "index_requests_on_community_id"
    t.index ["lender_id"], name: "index_requests_on_lender_id"
    t.index ["requested_by_id"], name: "index_requests_on_requested_by_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "username"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "community_id", null: false
    t.index ["community_id"], name: "index_users_on_community_id"
  end

  add_foreign_key "requests", "communities"
  add_foreign_key "requests", "users", column: "lender_id"
  add_foreign_key "requests", "users", column: "requested_by_id"
  add_foreign_key "users", "communities"
end
