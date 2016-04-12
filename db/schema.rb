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

ActiveRecord::Schema.define(version: 20160311070859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"
  enable_extension "uuid-ossp"

  create_table "events_events", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "title",          null: false
    t.text     "description",    null: false
    t.date     "event_date",     null: false
    t.time     "event_time",     null: false
    t.uuid     "user_id",        null: false
    t.uuid     "eventable_id"
    t.string   "eventable_type", null: false
    t.string   "location"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "events_events", ["eventable_id", "eventable_type"], name: "index_events_events_on_eventable_id_and_eventable_type", using: :btree
  add_index "events_events", ["user_id"], name: "index_events_events_on_user_id", using: :btree

  create_table "oauth_access_grants", force: true do |t|
    t.uuid     "resource_owner_id", null: false
    t.uuid     "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: true do |t|
    t.uuid     "resource_owner_id"
    t.uuid     "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: true do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.uuid     "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["owner_id", "owner_type"], name: "index_oauth_applications_on_owner_id_and_owner_type", using: :btree
  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "seed_migration_data_migrations", force: true do |t|
    t.string   "version"
    t.integer  "runtime"
    t.datetime "migrated_on"
  end

  create_table "users_system_memberships", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "user_id",                          null: false
    t.uuid     "system_user_role_id",              null: false
    t.integer  "status",                           null: false
    t.datetime "activated_at"
    t.datetime "deactivated_at"
    t.json     "data",                default: {}
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "users_system_memberships", ["status"], name: "index_users_system_memberships_on_status", using: :btree
  add_index "users_system_memberships", ["system_user_role_id"], name: "cusm_system_user_role_id", using: :btree
  add_index "users_system_memberships", ["user_id"], name: "index_users_system_memberships_on_user_id", unique: true, using: :btree

  create_table "users_system_user_roles", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.citext   "name",                             null: false
    t.integer  "status",           default: 0,     null: false
    t.boolean  "system_generated", default: false, null: false
    t.json     "data",             default: {}
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "users_system_user_roles", ["name"], name: "usur_name", using: :btree
  add_index "users_system_user_roles", ["name"], name: "usur_unique_index", unique: true, using: :btree
  add_index "users_system_user_roles", ["status"], name: "usur_status", using: :btree

  create_table "users_users", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "firstname",              default: "", null: false
    t.string   "lastname",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.json     "data",                   default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users_users", ["confirmation_token"], name: "index_users_users_on_confirmation_token", unique: true, using: :btree
  add_index "users_users", ["email"], name: "index_users_users_on_email", unique: true, using: :btree
  add_index "users_users", ["reset_password_token"], name: "index_users_users_on_reset_password_token", unique: true, using: :btree
  add_index "users_users", ["unlock_token"], name: "index_users_users_on_unlock_token", unique: true, using: :btree

end
