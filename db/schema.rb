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

ActiveRecord::Schema.define(version: 20150717134033) do

  create_table "measures", force: :cascade do |t|
    t.string   "type"
    t.string   "delta_notation"
    t.string   "cas_number"
    t.string   "sofa_mol_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "lipidmap_id"
    t.string   "pubchem_id"
    t.string   "chebi_id"
  end

  create_table "names", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "measure_id", precision: 38
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "names", ["measure_id"], name: "index_names_on_measure_id"

  create_table "plants", force: :cascade do |t|
    t.string   "name"
    t.string   "family"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "tnrs_name"
    t.string   "tnrs_family"
  end

  create_table "publications", force: :cascade do |t|
    t.string   "year"
    t.string   "authors"
    t.string   "journal"
    t.string   "volume"
    t.string   "page"
    t.string   "remarks"
    t.integer  "plant_id",   precision: 38
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "publications", ["plant_id"], name: "index_publications_on_plant_id"

  create_table "results", force: :cascade do |t|
    t.string   "value"
    t.string   "unit"
    t.integer  "measure_id",     precision: 38
    t.integer  "publication_id", precision: 38
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "results", ["measure_id"], name: "index_results_on_measure_id"
  add_index "results", ["publication_id"], name: "i_results_publication_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                                 default: "", null: false
    t.string   "encrypted_password",                    default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          precision: 38, default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "i_users_reset_password_token", unique: true

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",                     null: false
    t.integer  "item_id",        precision: 38, null: false
    t.string   "event",                         null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "i_versions_item_type_item_id"

  add_foreign_key "names", "measures"
  add_foreign_key "publications", "plants"
  add_foreign_key "results", "measures"
  add_foreign_key "results", "publications"
end
