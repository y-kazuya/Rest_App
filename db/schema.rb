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

ActiveRecord::Schema.define(version: 20181011025802) do

  create_table "holidays", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "holi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "avatar"
    t.integer "age"
    t.integer "phone_number"
    t.text "profile"
    t.string "born"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.index ["email"], name: "index_owners_on_email", unique: true
    t.index ["name"], name: "index_owners_on_name", unique: true
    t.index ["phone_number"], name: "index_owners_on_phone_number", unique: true
  end

  create_table "store_holidays", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "store_id"
    t.bigint "holiday_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["holiday_id"], name: "index_store_holidays_on_holiday_id"
    t.index ["store_id", "holiday_id"], name: "index_store_holidays_on_store_id_and_holiday_id"
    t.index ["store_id"], name: "index_store_holidays_on_store_id"
  end

  create_table "store_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "image"
    t.integer "status"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id", "image"], name: "index_store_images_on_store_id_and_image"
    t.index ["store_id"], name: "index_store_images_on_store_id"
  end

  create_table "stores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.integer "cate", null: false
    t.integer "ken", null: false
    t.string "adrres"
    t.string "kibo"
    t.integer "seki"
    t.text "profile"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "working_time"
    t.index ["name"], name: "index_stores_on_name"
    t.index ["owner_id"], name: "index_stores_on_owner_id"
  end

  create_table "stores_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "store_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_stores_tags_on_store_id"
    t.index ["tag_id"], name: "index_stores_tags_on_tag_id"
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  add_foreign_key "store_holidays", "holidays"
  add_foreign_key "store_holidays", "stores"
  add_foreign_key "store_images", "stores"
  add_foreign_key "stores", "owners"
end
