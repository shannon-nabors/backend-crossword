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

ActiveRecord::Schema.define(version: 2019_04_17_144447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cells", force: :cascade do |t|
    t.boolean "shaded"
    t.integer "number"
    t.string "letter"
    t.integer "row"
    t.integer "column"
    t.bigint "puzzle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["puzzle_id"], name: "index_cells_on_puzzle_id"
  end

  create_table "clue_cells", force: :cascade do |t|
    t.bigint "cell_id"
    t.bigint "clue_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cell_id"], name: "index_clue_cells_on_cell_id"
    t.index ["clue_id"], name: "index_clue_cells_on_clue_id"
  end

  create_table "clues", force: :cascade do |t|
    t.integer "number"
    t.string "direction"
    t.text "content"
    t.bigint "puzzle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["puzzle_id"], name: "index_clues_on_puzzle_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "puzzle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["puzzle_id"], name: "index_favorites_on_puzzle_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "puzzles", force: :cascade do |t|
    t.string "title"
    t.boolean "complete"
    t.integer "constructor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solves", force: :cascade do |t|
    t.bigint "puzzle_id"
    t.integer "solver_id"
    t.integer "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["puzzle_id"], name: "index_solves_on_puzzle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "username"
    t.string "password"
    t.string "image"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cells", "puzzles"
  add_foreign_key "clue_cells", "cells"
  add_foreign_key "clue_cells", "clues"
  add_foreign_key "clues", "puzzles"
  add_foreign_key "favorites", "puzzles"
  add_foreign_key "favorites", "users"
  add_foreign_key "solves", "puzzles"
end
