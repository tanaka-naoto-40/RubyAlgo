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

ActiveRecord::Schema[7.0].define(version: 2023_11_20_065058) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.text "content", null: false
    t.text "correct_code"
    t.text "explanation"
    t.boolean "answer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_answers_on_lesson_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "lesson_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_bookmarks_on_lesson_id"
    t.index ["user_id", "lesson_id"], name: "index_bookmarks_on_user_id_and_lesson_id", unique: true
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.string "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "title", null: false
    t.string "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_courses_on_category_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.text "hints"
    t.text "starter_code"
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_lessons_on_course_id"
  end

  create_table "progresses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "lesson_id"
    t.date "date"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_progresses_on_lesson_id"
    t.index ["user_id"], name: "index_progresses_on_user_id"
  end

  create_table "quiz_attempts", force: :cascade do |t|
    t.bigint "user_id"
    t.date "date"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_quiz_attempts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "provider"
    t.string "uid"
    t.time "alarm_time"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "lessons"
  add_foreign_key "bookmarks", "lessons"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "courses", "categories"
  add_foreign_key "lessons", "courses"
  add_foreign_key "progresses", "lessons"
  add_foreign_key "progresses", "users"
  add_foreign_key "quiz_attempts", "users"
end
