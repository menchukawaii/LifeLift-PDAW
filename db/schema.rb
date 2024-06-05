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

ActiveRecord::Schema[7.1].define(version: 2024_06_02_112308) do
  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "muscle_group"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inscriptions", force: :cascade do |t|
    t.string "goal"
    t.text "comment"
    t.integer "age"
    t.float "height"
    t.float "weight"
    t.float "weight_goal"
    t.float "body_fat"
    t.float "body_fat_goal"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_inscriptions_on_user_id"
  end

  create_table "rutine_sets", force: :cascade do |t|
    t.integer "exercise_id", null: false
    t.integer "rutine_id", null: false
    t.integer "reps"
    t.integer "weight"
    t.boolean "is_done", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_rutine_sets_on_exercise_id"
    t.index ["rutine_id"], name: "index_rutine_sets_on_rutine_id"
  end

  create_table "rutines", force: :cascade do |t|
    t.string "name"
    t.integer "day"
    t.integer "week"
    t.string "nutrition", default: "Musculo", null: false
    t.integer "user_id", null: false
    t.integer "trainer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rutines_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.boolean "is_admin"
    t.boolean "is_trainer"
    t.integer "trainer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "inscriptions", "users"
  add_foreign_key "rutine_sets", "exercises"
  add_foreign_key "rutine_sets", "rutines"
  add_foreign_key "rutines", "users"
end
