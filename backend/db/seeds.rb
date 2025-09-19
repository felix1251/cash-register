# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

gr1 = Product.create(name: 'Green Tea', code: 'GR1', base_price: 3.11)
sr1 = Product.create(name: 'Strawberry', code: 'SR1', base_price: 5.00)
cf1 = Product.create(name: 'Coffe', code: 'CF1', base_price: 11.23)

bogo = PromotionRule.create(rule_type: "BOGO", min_quantity: 2, discount_value: 1, description: "Buy 1 Get 1 Free")
bulk_fixed = PromotionRule.create(rule_type: "BULK_FIXED", min_quantity: 3, discount_value: 4.50, description: "Buy 3+ at $0.50 each")
bulk_factor = PromotionRule.create(rule_type: "BULK_FACTOR", min_quantity: 3, discount_value: 0.66666666667, description: "Buy 3+ at 2/3 of base price")

ProductPromotion.create(product: gr1, promotion_rule: bogo)
ProductPromotion.create(product: sr1, promotion_rule: bulk_fixed)
ProductPromotion.create(product: cf1, promotion_rule: bulk_factor)
