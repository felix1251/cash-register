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

ActiveRecord::Schema[7.2].define(version: 2025_09_19_061114) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "product_promotions", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "promotion_rule_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id", "promotion_rule_id"], name: "index_product_promotions_on_product_id_and_promotion_rule_id", unique: true
    t.index ["product_id"], name: "index_product_promotions_on_product_id"
    t.index ["promotion_rule_id"], name: "index_product_promotions_on_promotion_rule_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.decimal "base_price", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_products_on_code", unique: true
  end

  create_table "promotion_rules", force: :cascade do |t|
    t.string "rule_type", null: false
    t.integer "min_quantity", null: false
    t.decimal "discount_value", null: false
    t.string "description", null: false
    t.integer "priority", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "product_promotions", "products"
  add_foreign_key "product_promotions", "promotion_rules"
end
