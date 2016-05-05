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

ActiveRecord::Schema.define(version: 20160301214011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hours_logs", force: :cascade do |t|
    t.date    "date",         null: false
    t.float   "hours",        null: false
    t.integer "project_id"
    t.integer "user_id"
    t.string  "log_type",     null: false
    t.string  "service_type"
  end

  create_table "member", force: :cascade do |t|
    t.string "first_name",           limit: 2044, null: false
    t.string "last_name",            limit: 2044, null: false
    t.string "preferred_name",       limit: 2044, null: false
    t.string "status",               limit: 2044, null: false
    t.string "email",                limit: 2044, null: false
    t.string "phone",                limit: 2044, null: false
    t.string "street_permanent",     limit: 2044, null: false
    t.string "city_permanent",       limit: 2044, null: false
    t.string "state_permanent",      limit: 2044, null: false
    t.string "zip_permanent",        limit: 2044, null: false
    t.string "flag",                 limit: 2044, null: false
    t.string "shirt_size",           limit: 2044, null: false
    t.string "dietary_requirements", limit: 2044, null: false
    t.string "nspid",                limit: 2044, null: false
    t.string "do_not_contact",       limit: 2044, null: false
    t.string "full_name",            limit: 2044, null: false
    t.string "display_name",         limit: 2044, null: false
    t.string "created_timestamp",    limit: 2044, null: false
    t.string "created_staff",        limit: 2044, null: false
    t.string "mod_timestamp",        limit: 2044, null: false
  end

  create_table "member_term", force: :cascade do |t|
    t.integer "member_id"
    t.string  "term_status",                                              limit: 2044, null: false
    t.date    "start_date"
    t.date    "end_date"
    t.string  "program",                                                  limit: 2044, null: false
    t.decimal "living_allowance_rate"
    t.string  "living_allowance_unit",                                    limit: 2044, null: false
    t.string  "housing_provided",                                         limit: 2044, null: false
    t.date    "enrollment_paperwork_reviewed"
    t.date    "enrollment_paperwork_sent"
    t.date    "paperwork_due_date"
    t.date    "enrollment_add_payroll"
    t.date    "shirts_sent"
    t.date    "egrants_exit_form_released"
    t.date    "egrants_invite_sent"
    t.string  "americorps_award_level",                                   limit: 2044, null: false
    t.string  "americorps_award_status",                                  limit: 2044, null: false
    t.string  "americorps_enrollement_entered_into_egrants",              limit: 2044, null: false
    t.string  "americorps_exit_entered_into_egrants",                     limit: 2044, null: false
    t.string  "americorps_Y_N",                                           limit: 2044, null: false
    t.decimal "total_hours_plc"
    t.decimal "total_hours_worked"
    t.string  "exit_reason",                                              limit: 2044, null: false
    t.string  "exit_early_why_text",                                      limit: 2044, null: false
    t.string  "exiting_paperwork_reviewed",                               limit: 2044, null: false
    t.string  "exiting_paperwork_sent",                                   limit: 2044, null: false
    t.string  "received_ged_education_service",                           limit: 2044, null: false
    t.string  "received_industry_recognized_certification_or_credential", limit: 2044, null: false
    t.string  "received_workforce_development_services",                  limit: 2044, null: false
    t.date    "americorps_start_date"
    t.date    "americorps_end_date"
    t.string  "americorps_grant",                                         limit: 2044, null: false
    t.decimal "americorps_total_hours"
  end

  add_index "member_term", ["id"], name: "index_id", using: :btree

  create_table "project", force: :cascade do |t|
    t.string   "ace_id",             limit: 2044, null: false
    t.string   "project_number",     limit: 2044, null: false
    t.date     "start_date"
    t.date     "end_date"
    t.string   "invoice_unit",       limit: 2044, null: false
    t.decimal  "invoice_rate"
    t.string   "leader",             limit: 2044, null: false
    t.string   "title",              limit: 2044, null: false
    t.string   "crew_region",        limit: 2044, null: false
    t.string   "hitch",              limit: 2044, null: false
    t.string   "type",               limit: 2044, null: false
    t.string   "contact_name",       limit: 2044, null: false
    t.string   "contact_title",      limit: 2044, null: false
    t.string   "contact_phone",      limit: 2044, null: false
    t.string   "contact_email",      limit: 2044, null: false
    t.string   "contact_info",       limit: 2044, null: false
    t.datetime "creation_date",                   null: false
    t.datetime "modification_date",               null: false
    t.string   "creation_staff",     limit: 2044, null: false
    t.string   "modification_staff", limit: 2044, null: false
    t.string   "location",           limit: 2044, null: false
    t.string   "PLC",                limit: 2044, null: false
    t.string   "dollars_allocated",  limit: 2044, null: false
    t.string   "dollars_invoiced",   limit: 2044, null: false
    t.string   "dollars_remaining",  limit: 2044, null: false
  end

  create_table "project_member", force: :cascade do |t|
    t.integer "project_id",                   null: false
    t.integer "member_id",                    null: false
    t.string  "ace_id",          limit: 2044, null: false
    t.string  "title",           limit: 2044, null: false
    t.string  "position",        limit: 2044, null: false
    t.string  "assigned_intern", limit: 2044, null: false
    t.date    "start_date"
    t.date    "end_date"
    t.string  "cost_unit",       limit: 2044, null: false
    t.decimal "unit_rate",                    null: false
    t.decimal "match_rate",                   null: false
    t.string  "EAP",             limit: 2044, null: false
    t.string  "PLC",             limit: 2044, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
