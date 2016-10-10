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

ActiveRecord::Schema.define(version: 20161010183357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aulas", force: :cascade do |t|
    t.date     "semana"
    t.json     "monday"
    t.json     "tuesday"
    t.json     "wednesday"
    t.json     "thursday"
    t.json     "friday"
    t.json     "saturday"
    t.json     "sunday"
    t.boolean  "dinamica"
    t.integer  "instrutor_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "quantidade_semanas"
    t.index ["instrutor_id"], name: "index_aulas_on_instrutor_id", using: :btree
  end

  create_table "instancia_aulas", force: :cascade do |t|
    t.datetime "inicio"
    t.datetime "fim"
    t.integer  "aula_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aula_id"], name: "index_instancia_aulas_on_aula_id", using: :btree
  end

  create_table "instrutores", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "profissao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "aulas", "instrutores"
  add_foreign_key "instancia_aulas", "aulas"
end
