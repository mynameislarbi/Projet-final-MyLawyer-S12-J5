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

ActiveRecord::Schema.define(version: 2022_03_23_164015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "start_date"
    t.boolean "is_confirmed"
    t.boolean "is_paid"
    t.bigint "firm_id"
    t.bigint "lawyer_id"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_appointments_on_client_id"
    t.index ["firm_id"], name: "index_appointments_on_firm_id"
    t.index ["lawyer_id"], name: "index_appointments_on_lawyer_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.bigint "firm_id"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_comments_on_client_id"
    t.index ["firm_id"], name: "index_comments_on_firm_id"
  end

  create_table "departements", force: :cascade do |t|
    t.string "zip_code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "firms", force: :cascade do |t|
    t.string "name"
    t.integer "rating"
    t.string "address"
    t.string "phone_number"
    t.string "email"
    t.bigint "departement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departement_id"], name: "index_firms_on_departement_id"
  end

  create_table "law_types_by_firms", force: :cascade do |t|
    t.boolean "administratif"
    t.boolean "constitutionnel"
    t.boolean "prive"
    t.boolean "civil"
    t.boolean "social"
    t.boolean "penal"
    t.boolean "commercial"
    t.boolean "judiciaire"
    t.bigint "firm_id"
    t.bigint "lawyer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["firm_id"], name: "index_law_types_by_firms_on_firm_id"
    t.index ["lawyer_id"], name: "index_law_types_by_firms_on_lawyer_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "firm_id"
    t.bigint "user_id"
    t.integer "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["firm_id"], name: "index_ratings_on_firm_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.boolean "is_lawyer"
    t.boolean "is_admin"
    t.bigint "firm_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["firm_id"], name: "index_users_on_firm_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
