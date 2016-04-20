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

ActiveRecord::Schema.define(version: 20160419120328) do

  create_table "badges", force: :cascade do |t|
    t.string   "badge_name", limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "badges", ["user_id"], name: "index_badges_on_user_id", using: :btree

  create_table "characters", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.integer  "coins",      limit: 4
    t.integer  "exp",        limit: 4
    t.integer  "attack",     limit: 4
    t.integer  "defence",    limit: 4
    t.integer  "health",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "characters", ["user_id"], name: "index_characters_on_user_id", using: :btree

  create_table "histories", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "quiz_id",     limit: 4
    t.integer  "question_id", limit: 4
    t.integer  "option_id",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "histories", ["user_id", "quiz_id", "question_id", "option_id"], name: "my_index", using: :btree

  create_table "options", force: :cascade do |t|
    t.integer  "question_id", limit: 4
    t.string   "option",      limit: 255
    t.boolean  "correct"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "options", ["question_id"], name: "index_options_on_question_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "tot_points",   limit: 4
    t.integer  "correct_ans",  limit: 4
    t.integer  "wrong_ans",    limit: 4
    t.integer  "attempt_quiz", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "quiz_id",    limit: 4
    t.string   "question",   limit: 255
    t.integer  "point",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "questions", ["quiz_id"], name: "index_questions_on_quiz_id", using: :btree

  create_table "quizzes", force: :cascade do |t|
    t.string   "quiz_name",     limit: 255
    t.string   "category_name", limit: 255
    t.string   "level",         limit: 255
    t.integer  "duration",      limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",         limit: 255
    t.string   "last_name",          limit: 255
    t.string   "email",              limit: 255
    t.string   "role",               limit: 255
    t.string   "password_digest",    limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
  end

end
