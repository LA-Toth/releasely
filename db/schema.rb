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

ActiveRecord::Schema.define(version: 2021_02_12_081958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "components", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_components_on_name", unique: true
    t.index ["team_id"], name: "index_components_on_team_id"
  end

  create_table "issues", force: :cascade do |t|
    t.string "issue_key", null: false
    t.string "title", null: false
    t.string "state", null: false
    t.boolean "blocker", default: false, null: false
    t.datetime "last_updated_at", null: false
    t.datetime "last_reply_at", null: false
    t.bigint "assignee_id", null: false
    t.integer "issue_category", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignee_id"], name: "index_issues_on_assignee_id"
    t.index ["blocker"], name: "index_issues_on_blocker"
    t.index ["issue_category"], name: "index_issues_on_issue_category"
    t.index ["issue_key"], name: "index_issues_on_issue_key", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_products_on_name", unique: true
  end

  create_table "release_versions", force: :cascade do |t|
    t.string "version", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["version"], name: "index_release_versions_on_version", unique: true
  end

  create_table "releases", force: :cascade do |t|
    t.bigint "version_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_releases_on_product_id"
    t.index ["version_id", "product_id"], name: "index_releases_on_version_id_and_product_id", unique: true
    t.index ["version_id"], name: "index_releases_on_version_id"
  end

  create_table "sub_components", force: :cascade do |t|
    t.string "name"
    t.bigint "component_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["component_id"], name: "index_sub_components_on_component_id"
    t.index ["name"], name: "index_sub_components_on_name", unique: true
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "lead_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lead_id"], name: "index_teams_on_lead_id"
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

  create_table "test_configs", force: :cascade do |t|
    t.string "name", null: false
    t.string "short_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_test_configs_on_name", unique: true
  end

  create_table "test_splits", force: :cascade do |t|
    t.bigint "sub_component_id", null: false
    t.string "name", null: false
    t.integer "split_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sub_component_id", "name", "split_id"], name: "index_test_splits_on_sub_component_id_and_name_and_split_id", unique: true
    t.index ["sub_component_id"], name: "index_test_splits_on_sub_component_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "given_name", null: false
    t.string "family_name", default: "", null: false
    t.string "password_digest", null: false
    t.boolean "can_log_in", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "team_id", default: 1, null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "components", "teams"
  add_foreign_key "issues", "users", column: "assignee_id"
  add_foreign_key "releases", "products"
  add_foreign_key "releases", "release_versions", column: "version_id"
  add_foreign_key "sub_components", "components"
  add_foreign_key "teams", "users", column: "lead_id"
  add_foreign_key "test_splits", "sub_components"
  add_foreign_key "users", "teams"
end
