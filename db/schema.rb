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

ActiveRecord::Schema.define(version: 20150803053243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.text     "atext"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "question_set_subscriptions", force: :cascade do |t|
    t.integer  "question_set_id"
    t.integer  "user_id"
    t.integer  "period"
    t.datetime "last_ask_at"
    t.integer  "last_question_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "question_set_subscriptions", ["question_set_id"], name: "index_question_set_subscriptions_on_question_set_id", using: :btree
  add_index "question_set_subscriptions", ["user_id"], name: "index_question_set_subscriptions_on_user_id", using: :btree

  create_table "question_sets", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "question_sets", ["user_id"], name: "index_question_sets_on_user_id", using: :btree

  create_table "question_sets_questions", id: false, force: :cascade do |t|
    t.integer "question_set_id", null: false
    t.integer "question_id",     null: false
  end

  add_index "question_sets_questions", ["question_id"], name: "index_question_sets_questions_on_question_id", using: :btree
  add_index "question_sets_questions", ["question_set_id"], name: "index_question_sets_questions_on_question_set_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text     "qtext",      null: false
    t.integer  "user_id"
    t.boolean  "public",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["qtext"], name: "index_questions_on_qtext", using: :btree
  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",      null: false
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  create_table "widgets", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "question_set_subscriptions", "question_sets"
  add_foreign_key "question_set_subscriptions", "users"
  add_foreign_key "question_sets", "users"
  add_foreign_key "questions", "users"
end
