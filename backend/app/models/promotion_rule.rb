class PromotionRule < ApplicationRecord
  has_many :product_promotions
end

# == Schema Information
#
# Table name: promotion_rules
#
#  id             :bigint           not null, primary key
#  description    :string           not null
#  discount_value :decimal(, )      not null
#  min_quantity   :integer          not null
#  priority       :integer          default(0)
#  rule_type      :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_promotion_rules_on_rule_type  (rule_type) UNIQUE
#
