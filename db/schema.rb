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

ActiveRecord::Schema.define(version: 20180922204155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active", default: true
    t.integer "events_count"
    t.string "category_image"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "max_limit"
    t.integer "author_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short_description"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "preview_image"
    t.string "background_image"
    t.string "map_file"
    t.bigint "category_id"
    t.string "coupon_code"
    t.boolean "is_private", default: false
    t.string "slug"
    t.string "telegram"
    t.decimal "price"
    t.string "author_name"
    t.index ["author_id"], name: "index_events_on_author_id"
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["slug"], name: "index_events_on_slug"
  end

  create_table "jwt_blacklists", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_blacklists_on_jti"
  end

  create_table "news_items", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_news_items_on_user_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.string "name"
    t.string "sex"
    t.string "avatar"
    t.integer "kilometers"
    t.string "phone"
    t.boolean "is_admin", default: false
    t.integer "visits_count"
    t.string "telegram"
    t.string "vk"
    t.string "facebook"
    t.string "twitter"
    t.string "my_telegram"
    t.string "bank_payment_page"
    t.boolean "accept_rights", default: true
    t.boolean "is_banned", default: false
    t.integer "pace", default: 0
    t.integer "shooting", default: 0
    t.integer "passing", default: 0
    t.integer "dribbling", default: 0
    t.integer "defending", default: 0
    t.integer "physicality", default: 0
    t.integer "position_cd"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.integer "choice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.integer "author_id"
    t.index ["author_id"], name: "index_visits_on_author_id"
    t.index ["event_id"], name: "index_visits_on_event_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  add_foreign_key "events", "categories"
  add_foreign_key "news_items", "users"
  add_foreign_key "visits", "events"
  add_foreign_key "visits", "users"
end
