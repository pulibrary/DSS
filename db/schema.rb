# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_15_210121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "user_type"
    t.string "document_id"
    t.string "document_type"
    t.binary "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_bookmarks_on_document_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.integer "key_term_id"
    t.datetime "key_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries_resources", id: false, force: :cascade do |t|
    t.bigint "country_id"
    t.bigint "resource_id"
    t.index ["country_id"], name: "index_countries_resources_on_country_id"
    t.index ["resource_id"], name: "index_countries_resources_on_resource_id"
  end

  create_table "countries_studies", id: false, force: :cascade do |t|
    t.bigint "country_id"
    t.bigint "study_id"
    t.index ["country_id"], name: "index_countries_studies_on_country_id"
    t.index ["study_id"], name: "index_countries_studies_on_study_id"
  end

  create_table "data_files", force: :cascade do |t|
    t.integer "legacy_id"
    t.string "files"
    t.string "size"
    t.decimal "comp_size"
    t.string "line_count"
    t.string "line_length"
    t.string "part"
    t.string "file_type_a"
    t.string "file_type_b"
    t.string "flag_one"
    t.string "flag_two"
    t.string "file_type_tech"
    t.string "note"
    t.integer "study_num"
    t.string "permission"
    t.datetime "timestamp"
    t.integer "original_study_id"
    t.bigint "study_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_id"], name: "index_data_files_on_study_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.integer "key_term_id"
    t.datetime "key_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions_resources", id: false, force: :cascade do |t|
    t.bigint "region_id"
    t.bigint "resource_id"
    t.index ["region_id"], name: "index_regions_resources_on_region_id"
    t.index ["resource_id"], name: "index_regions_resources_on_resource_id"
  end

  create_table "regions_studies", id: false, force: :cascade do |t|
    t.bigint "region_id"
    t.bigint "study_id"
    t.index ["region_id"], name: "index_regions_studies_on_region_id"
    t.index ["study_id"], name: "index_regions_studies_on_study_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.integer "resource_id"
    t.string "url"
    t.text "blurb"
    t.datetime "link_time"
    t.string "sample"
    t.string "principal_investigator"
    t.string "producer"
    t.string "distributor"
    t.string "version"
    t.string "more_detail_url"
    t.string "resource_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources_subjects", id: false, force: :cascade do |t|
    t.bigint "subject_id"
    t.bigint "resource_id"
    t.index ["resource_id"], name: "index_resources_subjects_on_resource_id"
    t.index ["subject_id"], name: "index_resources_subjects_on_subject_id"
  end

  create_table "searches", force: :cascade do |t|
    t.binary "query_params"
    t.integer "user_id"
    t.string "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "studies", force: :cascade do |t|
    t.integer "legacy_id"
    t.integer "studynum"
    t.string "title"
    t.string "medium"
    t.string "icpsr_num"
    t.string "url"
    t.string "directory"
    t.string "folder"
    t.boolean "r_flag"
    t.datetime "timestamp"
    t.boolean "auto_refresh"
    t.text "note"
    t.string "roper"
    t.integer "voyager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "resource_id"
    t.index ["resource_id"], name: "index_studies_on_resource_id"
  end

  create_table "studies_subjects", id: false, force: :cascade do |t|
    t.bigint "subject_id"
    t.bigint "study_id"
    t.index ["study_id"], name: "index_studies_subjects_on_study_id"
    t.index ["subject_id"], name: "index_studies_subjects_on_subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.integer "key_term_id"
    t.datetime "key_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "guest", default: false
    t.string "provider"
    t.string "uid"
    t.string "username"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
    t.index ["uid"], name: "index_users_on_uid"
    t.index ["username"], name: "index_users_on_username"
  end

end
