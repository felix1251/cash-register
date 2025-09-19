class ProductPromotion < ApplicationRecord
  belongs_to :product
  belongs_to :promotion_rule
end

# == Schema Information
#
# Table name: product_promotions
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  product_id        :bigint           not null
#  promotion_rule_id :bigint           not null
#
# Indexes
#
#  index_product_promotions_on_product_id                        (product_id)
#  index_product_promotions_on_product_id_and_promotion_rule_id  (product_id,promotion_rule_id) UNIQUE
#  index_product_promotions_on_promotion_rule_id                 (promotion_rule_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (promotion_rule_id => promotion_rules.id)
#
