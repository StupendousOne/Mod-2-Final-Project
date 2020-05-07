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

ActiveRecord::Schema.define(version: 2020_05_06_202737) do

  create_table "bathrooms", force: :cascade do |t|
    t.integer "size"
    t.boolean "half"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "room_style_id"
    t.integer "user_id"
    t.index ["room_style_id"], name: "index_bathrooms_on_room_style_id"
    t.index ["user_id"], name: "index_bathrooms_on_user_id"
  end

  create_table "bedrooms", force: :cascade do |t|
    t.integer "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "room_style_id"
    t.integer "user_id"
    t.index ["room_style_id"], name: "index_bedrooms_on_room_style_id"
    t.index ["user_id"], name: "index_bedrooms_on_user_id"
  end

  create_table "garages", force: :cascade do |t|
    t.integer "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "room_style_id"
    t.integer "user_id"
    t.index ["room_style_id"], name: "index_garages_on_room_style_id"
    t.index ["user_id"], name: "index_garages_on_user_id"
  end

  create_table "housebathrooms", force: :cascade do |t|
    t.integer "house_id", null: false
    t.integer "bathroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bathroom_id"], name: "index_housebathrooms_on_bathroom_id"
    t.index ["house_id"], name: "index_housebathrooms_on_house_id"
  end

  create_table "housebedrooms", force: :cascade do |t|
    t.integer "house_id", null: false
    t.integer "bedroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bedroom_id"], name: "index_housebedrooms_on_bedroom_id"
    t.index ["house_id"], name: "index_housebedrooms_on_house_id"
  end

  create_table "housegarages", force: :cascade do |t|
    t.integer "house_id", null: false
    t.integer "garage_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["garage_id"], name: "index_housegarages_on_garage_id"
    t.index ["house_id"], name: "index_housegarages_on_house_id"
  end

  create_table "housekitchens", force: :cascade do |t|
    t.integer "house_id", null: false
    t.integer "kitchen_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["house_id"], name: "index_housekitchens_on_house_id"
    t.index ["kitchen_id"], name: "index_housekitchens_on_kitchen_id"
  end

  create_table "houseothers", force: :cascade do |t|
    t.integer "house_id", null: false
    t.integer "other_room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["house_id"], name: "index_houseothers_on_house_id"
    t.index ["other_room_id"], name: "index_houseothers_on_other_room_id"
  end

  create_table "houses", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_houses_on_user_id"
  end

  create_table "kitchens", force: :cascade do |t|
    t.integer "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "room_style_id"
    t.integer "user_id"
    t.index ["room_style_id"], name: "index_kitchens_on_room_style_id"
    t.index ["user_id"], name: "index_kitchens_on_user_id"
  end

  create_table "other_rooms", force: :cascade do |t|
    t.string "room_type"
    t.integer "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "room_style_id"
    t.integer "user_id"
    t.index ["room_style_id"], name: "index_other_rooms_on_room_style_id"
    t.index ["user_id"], name: "index_other_rooms_on_user_id"
  end

  create_table "room_styles", force: :cascade do |t|
    t.string "style"
    t.float "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_room_styles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "show_name"
    t.boolean "deactivated"
  end

  add_foreign_key "bathrooms", "room_styles"
  add_foreign_key "bathrooms", "users", on_delete: :cascade
  add_foreign_key "bedrooms", "room_styles"
  add_foreign_key "bedrooms", "users", on_delete: :cascade
  add_foreign_key "garages", "room_styles"
  add_foreign_key "garages", "users", on_delete: :cascade
  add_foreign_key "housebathrooms", "bathrooms"
  add_foreign_key "housebathrooms", "houses"
  add_foreign_key "housebedrooms", "bedrooms"
  add_foreign_key "housebedrooms", "houses"
  add_foreign_key "housegarages", "garages"
  add_foreign_key "housegarages", "houses"
  add_foreign_key "housekitchens", "houses"
  add_foreign_key "housekitchens", "kitchens"
  add_foreign_key "houseothers", "houses"
  add_foreign_key "houseothers", "other_rooms"
  add_foreign_key "houses", "users", on_delete: :cascade
  add_foreign_key "kitchens", "room_styles"
  add_foreign_key "kitchens", "users", on_delete: :cascade
  add_foreign_key "other_rooms", "room_styles"
  add_foreign_key "other_rooms", "users", on_delete: :cascade
  add_foreign_key "room_styles", "users", on_delete: :cascade
end
