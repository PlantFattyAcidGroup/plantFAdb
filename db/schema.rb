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

ActiveRecord::Schema.define(version: 20171118155137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "datasets", force: :cascade do |t|
    t.string   "remarks"
    t.string   "notes"
    t.string   "lipid_type"
    t.string   "dbxref_value"
    t.integer  "plants_pub_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "draft_id"
    t.datetime "published_at"
    t.datetime "trashed_at"
    t.integer  "dbxref_id"
    t.string   "tissue"
  end

  create_table "dbxrefs", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drafts", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "previous_draft"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "object_changes"
  end

  add_index "drafts", ["created_at"], name: "index_drafts_on_created_at", using: :btree
  add_index "drafts", ["event"], name: "index_drafts_on_event", using: :btree
  add_index "drafts", ["item_id"], name: "index_drafts_on_item_id", using: :btree
  add_index "drafts", ["item_type"], name: "index_drafts_on_item_type", using: :btree
  add_index "drafts", ["updated_at"], name: "index_drafts_on_updated_at", using: :btree
  add_index "drafts", ["whodunnit"], name: "index_drafts_on_whodunnit", using: :btree

  create_table "measures", force: :cascade do |t|
    t.string   "type"
    t.string   "delta_notation"
    t.string   "cas_number"
    t.string   "sofa_mol_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "lipidmap_id"
    t.string   "pubchem_id"
    t.string   "chebi_id"
    t.text     "structure"
    t.float    "mass"
    t.string   "name"
    t.string   "other_names",    limit: 3999
    t.string   "formula"
    t.text     "cml"
    t.string   "inchi"
    t.string   "stdinchi"
    t.string   "stdinchikey"
    t.string   "smiles"
    t.string   "image_link"
    t.string   "common_name"
    t.string   "category"
    t.integer  "draft_id"
    t.datetime "published_at"
    t.datetime "trashed_at"
    t.string   "iupac_name"
    t.integer  "user_id"
  end

  create_table "names", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "measure_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.text   "content"
  end

  create_table "plants", force: :cascade do |t|
    t.string   "sofa_name"
    t.string   "sofa_family"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "tnrs_name"
    t.string   "tnrs_family"
    t.string   "note",                limit: 3999
    t.string   "tnrs_match"
    t.string   "name_status"
    t.string   "family"
    t.string   "genus"
    t.string   "species"
    t.string   "tropicos_url"
    t.integer  "ott_id"
    t.string   "accepted_rank"
    t.string   "matched_rank"
    t.string   "order_name"
    t.string   "common_name"
    t.integer  "draft_id"
    t.datetime "published_at"
    t.datetime "trashed_at"
    t.string   "variety"
    t.string   "tissue",                           default: "Unknown"
    t.integer  "user_id"
    t.string   "authority"
    t.string   "tnrs_name_submitted"
  end

  create_table "plants_pubs", force: :cascade do |t|
    t.integer  "pub_id"
    t.integer  "plant_id"
    t.string   "remarks"
    t.string   "notes"
    t.integer  "draft_id"
    t.datetime "published_at"
    t.datetime "trashed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "plants_pubs", ["plant_id"], name: "index_plants_pubs_on_plant_id", using: :btree
  add_index "plants_pubs", ["pub_id"], name: "index_plants_pubs_on_pub_id", using: :btree

  create_table "publications", force: :cascade do |t|
    t.string   "year"
    t.string   "authors"
    t.string   "journal"
    t.string   "volume"
    t.string   "page"
    t.string   "remarks"
    t.integer  "plant_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "sofa_tab_id"
  end

  add_index "publications", ["plant_id"], name: "index_publications_on_plant_id", using: :btree

  create_table "pubs", force: :cascade do |t|
    t.string   "year"
    t.string   "authors"
    t.string   "journal"
    t.string   "volume"
    t.string   "page"
    t.string   "remarks"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "wos_uid"
    t.string   "wos_journal"
    t.string   "wos_title",     limit: 500
    t.string   "wos_volume"
    t.string   "wos_authors"
    t.string   "wos_pages"
    t.string   "wos_year"
    t.string   "doi"
    t.text     "original_pubs"
    t.string   "abstract",      limit: 4000
    t.string   "url",           limit: 1000
    t.integer  "draft_id"
    t.datetime "published_at"
    t.datetime "trashed_at"
    t.integer  "user_id"
    t.string   "note"
  end

  create_table "results", force: :cascade do |t|
    t.decimal  "value",          precision: 8, scale: 2
    t.string   "unit"
    t.integer  "measure_id"
    t.integer  "publication_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "pub_id"
    t.integer  "plant_id"
    t.decimal  "old_mol_val",    precision: 8, scale: 2
    t.integer  "draft_id"
    t.datetime "published_at"
    t.datetime "trashed_at"
    t.integer  "plants_pub_id"
    t.integer  "dataset_id"
  end

  add_index "results", ["measure_id"], name: "index_results_on_measure_id", using: :btree
  add_index "results", ["publication_id"], name: "index_results_on_publication_id", using: :btree

  create_table "sofa_tabs", force: :cascade do |t|
    t.integer "pub_id"
    t.string  "sofa_tab_id"
  end

  create_table "tree_nodes", force: :cascade do |t|
    t.string  "name"
    t.string  "common_name"
    t.string  "note",           limit: 3999
    t.string  "ancestry"
    t.string  "string"
    t.integer "ancestry_depth",              default: 0
    t.integer "pos",                         default: 0
    t.string  "color"
  end

  add_index "tree_nodes", ["ancestry"], name: "index_tree_nodes_on_ancestry", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts"
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "results", "measures"
  add_foreign_key "results", "publications"
end
