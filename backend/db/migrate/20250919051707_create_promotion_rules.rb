class CreatePromotionRules < ActiveRecord::Migration[7.2]
  def change
    create_table :promotion_rules do |t|
      t.string :rule_type, null: false
      t.integer :min_quantity, null: false
      t.decimal :discount_value, null: false
      t.string :description, null: false
      t.integer :priority, default: 0

      t.timestamps
    end
  end
end
