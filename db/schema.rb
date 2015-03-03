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

ActiveRecord::Schema.define(version: 20150227024157) do

  create_table "auth_group", force: :cascade do |t|
    t.string "name", limit: 80, null: false
  end

  add_index "auth_group", ["name"], name: "name", unique: true, using: :btree

  create_table "auth_group_permissions", force: :cascade do |t|
    t.integer "group_id",      limit: 4, null: false
    t.integer "permission_id", limit: 4, null: false
  end

  add_index "auth_group_permissions", ["group_id", "permission_id"], name: "group_id", unique: true, using: :btree
  add_index "auth_group_permissions", ["group_id"], name: "auth_group_permissions_5f412f9a", using: :btree
  add_index "auth_group_permissions", ["permission_id"], name: "auth_group_permissions_83d7f98b", using: :btree

  create_table "auth_permission", force: :cascade do |t|
    t.string  "name",            limit: 50,  null: false
    t.integer "content_type_id", limit: 4,   null: false
    t.string  "codename",        limit: 100, null: false
  end

  add_index "auth_permission", ["content_type_id", "codename"], name: "content_type_id", unique: true, using: :btree
  add_index "auth_permission", ["content_type_id"], name: "auth_permission_37ef4eb4", using: :btree

  create_table "auth_user", force: :cascade do |t|
    t.string   "password",     limit: 128, null: false
    t.datetime "last_login",               null: false
    t.boolean  "is_superuser", limit: 1,   null: false
    t.string   "username",     limit: 30,  null: false
    t.string   "first_name",   limit: 30,  null: false
    t.string   "last_name",    limit: 30,  null: false
    t.string   "email",        limit: 75,  null: false
    t.boolean  "is_staff",     limit: 1,   null: false
    t.boolean  "is_active",    limit: 1,   null: false
    t.datetime "date_joined",              null: false
  end

  add_index "auth_user", ["username"], name: "username", unique: true, using: :btree

  create_table "auth_user_groups", force: :cascade do |t|
    t.integer "user_id",  limit: 4, null: false
    t.integer "group_id", limit: 4, null: false
  end

  add_index "auth_user_groups", ["group_id"], name: "auth_user_groups_5f412f9a", using: :btree
  add_index "auth_user_groups", ["user_id", "group_id"], name: "user_id", unique: true, using: :btree
  add_index "auth_user_groups", ["user_id"], name: "auth_user_groups_6340c63c", using: :btree

  create_table "auth_user_user_permissions", force: :cascade do |t|
    t.integer "user_id",       limit: 4, null: false
    t.integer "permission_id", limit: 4, null: false
  end

  add_index "auth_user_user_permissions", ["permission_id"], name: "auth_user_user_permissions_83d7f98b", using: :btree
  add_index "auth_user_user_permissions", ["user_id", "permission_id"], name: "user_id", unique: true, using: :btree
  add_index "auth_user_user_permissions", ["user_id"], name: "auth_user_user_permissions_6340c63c", using: :btree

  create_table "django_admin_log", force: :cascade do |t|
    t.datetime "action_time",                        null: false
    t.integer  "user_id",         limit: 4,          null: false
    t.integer  "content_type_id", limit: 4
    t.text     "object_id",       limit: 4294967295
    t.string   "object_repr",     limit: 200,        null: false
    t.integer  "action_flag",     limit: 2,          null: false
    t.text     "change_message",  limit: 4294967295, null: false
  end

  add_index "django_admin_log", ["content_type_id"], name: "django_admin_log_37ef4eb4", using: :btree
  add_index "django_admin_log", ["user_id"], name: "django_admin_log_6340c63c", using: :btree

  create_table "django_content_type", force: :cascade do |t|
    t.string "name",      limit: 100, null: false
    t.string "app_label", limit: 100, null: false
    t.string "model",     limit: 100, null: false
  end

  add_index "django_content_type", ["app_label", "model"], name: "app_label", unique: true, using: :btree

  create_table "django_session", primary_key: "session_key", force: :cascade do |t|
    t.text     "session_data", limit: 4294967295, null: false
    t.datetime "expire_date",                     null: false
  end

  add_index "django_session", ["expire_date"], name: "django_session_b7b81f0c", using: :btree

  create_table "django_site", force: :cascade do |t|
    t.string "domain", limit: 100, null: false
    t.string "name",   limit: 50,  null: false
  end

  create_table "main_category", force: :cascade do |t|
    t.string  "icon",      limit: 100, null: false
    t.string  "pin_icon",  limit: 100, null: false
    t.string  "color",     limit: 10,  null: false
    t.boolean "is_active", limit: 1,   null: false
  end

  create_table "main_comment", force: :cascade do |t|
    t.integer  "place_id",  limit: 4,          null: false
    t.string   "name",      limit: 64
    t.string   "email",     limit: 64
    t.text     "comment",   limit: 4294967295
    t.datetime "date",                         null: false
    t.boolean  "is_active", limit: 1,          null: false
  end

  add_index "main_comment", ["place_id"], name: "main_comment_ea3591c8", using: :btree

  create_table "main_deal", force: :cascade do |t|
    t.integer  "place_id",    limit: 4,   null: false
    t.string   "title",       limit: 128
    t.string   "description", limit: 512
    t.string   "url",         limit: 512
    t.datetime "start_date",              null: false
    t.datetime "end_date",                null: false
  end

  add_index "main_deal", ["place_id"], name: "main_deal_ea3591c8", using: :btree

  create_table "main_dealphoto", force: :cascade do |t|
    t.integer "deal_id", limit: 4,   null: false
    t.string  "address", limit: 100, null: false
    t.string  "info",    limit: 256
  end

  add_index "main_dealphoto", ["deal_id"], name: "main_dealphoto_1a9336ea", using: :btree

  create_table "main_extcategoryname", force: :cascade do |t|
    t.integer "category_id", limit: 4,   null: false
    t.integer "lang_code",   limit: 4,   null: false
    t.string  "name",        limit: 128
  end

  add_index "main_extcategoryname", ["category_id"], name: "main_extcategoryname_6f33f001", using: :btree

  create_table "main_hotspot", force: :cascade do |t|
    t.string  "name",     limit: 128
    t.string  "position", limit: 42,  null: false
    t.string  "icon",     limit: 100, null: false
    t.integer "radius",   limit: 4,   null: false
  end

  create_table "main_photo", force: :cascade do |t|
    t.integer "place_id", limit: 4,   null: false
    t.string  "address",  limit: 100, null: false
    t.string  "info",     limit: 256
  end

  add_index "main_photo", ["place_id"], name: "main_photo_ea3591c8", using: :btree

  create_table "main_place", force: :cascade do |t|
    t.string  "name",          limit: 64,  null: false
    t.integer "category_id",   limit: 4,   null: false
    t.string  "description",   limit: 255
    t.string  "position",      limit: 42,  null: false
    t.string  "address",       limit: 140
    t.string  "city",          limit: 64
    t.string  "country",       limit: 64
    t.string  "webpage",       limit: 128
    t.string  "tel",           limit: 64
    t.string  "twitter",       limit: 32
    t.string  "facebook",      limit: 32
    t.time    "hours_start"
    t.time    "hours_end"
    t.boolean "always_open",   limit: 1,   null: false
    t.float   "ratings",       limit: 53
    t.integer "ratings_count", limit: 4
    t.integer "likes_count",   limit: 4
    t.boolean "is_featured",   limit: 1,   null: false
    t.integer "order",         limit: 4
  end

  add_index "main_place", ["category_id", "order"], name: "main_place_category_id_7d0f2221d49ecc99_uniq", unique: true, using: :btree
  add_index "main_place", ["category_id"], name: "main_place_6f33f001", using: :btree

  create_table "main_siteproperties", force: :cascade do |t|
    t.boolean "generated",  limit: 1,   null: false
    t.string  "client_key", limit: 256
  end

  create_table "south_migrationhistory", force: :cascade do |t|
    t.string   "app_name",  limit: 255, null: false
    t.string   "migration", limit: 255, null: false
    t.datetime "applied",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.integer  "role",                   limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "group_id_refs_id_f4b32aac"
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "permission_id_refs_id_6ba0f519"
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "content_type_id_refs_id_d043b34a"
  add_foreign_key "auth_user_groups", "auth_group", column: "group_id", name: "group_id_refs_id_274b862c"
  add_foreign_key "auth_user_groups", "auth_user", column: "user_id", name: "user_id_refs_id_40c41112"
  add_foreign_key "auth_user_user_permissions", "auth_permission", column: "permission_id", name: "permission_id_refs_id_35d9ac25"
  add_foreign_key "auth_user_user_permissions", "auth_user", column: "user_id", name: "user_id_refs_id_4dc23c39"
  add_foreign_key "django_admin_log", "auth_user", column: "user_id", name: "user_id_refs_id_c0d12874"
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "content_type_id_refs_id_93d2d1f8"
  add_foreign_key "main_comment", "main_place", column: "place_id", name: "place_id_refs_id_163f825f"
  add_foreign_key "main_deal", "main_place", column: "place_id", name: "place_id_refs_id_38921a0e"
  add_foreign_key "main_dealphoto", "main_deal", column: "deal_id", name: "deal_id_refs_id_870177bb"
  add_foreign_key "main_extcategoryname", "main_category", column: "category_id", name: "category_id_refs_id_b74a7b0a"
  add_foreign_key "main_photo", "main_place", column: "place_id", name: "place_id_refs_id_c7b9a77a"
  add_foreign_key "main_place", "main_category", column: "category_id", name: "category_id_refs_id_4985c9be"
end
