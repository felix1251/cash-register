class CreateProductPromotions < ActiveRecord::Migration[7.2]
  def change
    create_table :product_promotions do |t|
      t.references :product, null: false, foreign_key: true
      t.references :promotion_rule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
