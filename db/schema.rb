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

ActiveRecord::Schema[7.0].define(version: 2023_05_15_220429) do
  create_table "answers", force: :cascade do |t|
    t.string "answers"
    t.integer "user_id"
    t.integer "exam_id"
    t.index ["exam_id"], name: "index_answers_on_exam_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "exams", force: :cascade do |t|
    t.integer "score"
    t.integer "lifes"
    t.integer "time"
  end

  create_table "options", force: :cascade do |t|
    t.string "option"
    t.string "option1"
    t.string "option2"
    t.string "correcta"
  end

  create_table "practices", force: :cascade do |t|
    t.string "theoric"
    t.string "category"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.integer "option_id"
    t.integer "practice_id"
    t.index ["option_id"], name: "index_questions_on_option_id", unique: true
    t.index ["practice_id"], name: "index_questions_on_practice_id", unique: true
  end

  create_table "questions_exams", id: false, force: :cascade do |t|
    t.integer "question_id"
    t.integer "exam_id"
    t.index ["exam_id"], name: "index_questions_exams_on_exam_id"
    t.index ["question_id"], name: "index_questions_exams_on_question_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.integer "total_score", default: 0
  end

  create_table "users_exams", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "exam_id"
    t.index ["exam_id"], name: "index_users_exams_on_exam_id"
    t.index ["user_id"], name: "index_users_exams_on_user_id"
  end

end
