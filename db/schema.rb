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

ActiveRecord::Schema.define(version: 20160920051839) do

  create_table "bookmarks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                     null: false
    t.string   "user_type"
    t.string   "document_id"
    t.string   "document_type"
    t.binary   "title",         limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["document_id"], name: "index_bookmarks_on_document_id", using: :btree
    t.index ["user_id"], name: "index_bookmarks_on_user_id", using: :btree
  end

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "key_term_id"
    t.datetime "key_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "countries_resources", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "country_id"
    t.integer "resource_id"
    t.index ["country_id"], name: "index_countries_resources_on_country_id", using: :btree
    t.index ["resource_id"], name: "index_countries_resources_on_resource_id", using: :btree
  end

  create_table "data_files", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "legacy_id"
    t.string   "files"
    t.string   "size"
    t.decimal  "comp_size",         precision: 10
    t.string   "line_count"
    t.string   "line_length"
    t.string   "part"
    t.string   "file_type_a"
    t.string   "file_type_b"
    t.string   "flag_one"
    t.string   "flag_two"
    t.string   "file_type_tech"
    t.string   "note"
    t.integer  "study_num"
    t.string   "permission"
    t.datetime "timestamp"
    t.integer  "original_study_id"
    t.integer  "study_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["study_id"], name: "index_data_files_on_study_id", using: :btree
  end

  create_table "regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "key_term_id"
    t.datetime "key_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "resources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "url"
    t.text     "blurb",                  limit: 65535
    t.datetime "link_time"
    t.string   "sample"
    t.string   "principal_investigator"
    t.string   "producer"
    t.string   "distributor"
    t.string   "version"
    t.string   "more_detail_url"
    t.string   "resource_type"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "resources_regions", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "region_id"
    t.integer "resource_id"
    t.index ["region_id"], name: "index_resources_regions_on_region_id", using: :btree
    t.index ["resource_id"], name: "index_resources_regions_on_resource_id", using: :btree
  end

  create_table "resources_subjects", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "subject_id"
    t.integer "resource_id"
    t.index ["resource_id"], name: "index_resources_subjects_on_resource_id", using: :btree
    t.index ["subject_id"], name: "index_resources_subjects_on_subject_id", using: :btree
  end

  create_table "searches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary   "query_params", limit: 65535
    t.integer  "user_id"
    t.string   "user_type"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_searches_on_user_id", using: :btree
  end

  create_table "studies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "legacy_id"
    t.integer  "studynum"
    t.string   "title"
    t.string   "medium"
    t.string   "icpsr_num"
    t.string   "url"
    t.string   "directory"
    t.string   "folder"
    t.boolean  "r_flag"
    t.datetime "timestamp"
    t.boolean  "auto_refresh"
    t.text     "note",         limit: 65535
    t.string   "roper"
    t.integer  "voyager_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "key_term_id"
    t.datetime "key_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "guest",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
