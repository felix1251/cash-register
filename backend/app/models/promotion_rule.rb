class PromotionRule < ApplicationRecord
  RULE_TYPES = %w[BOGO BULK_FIXED BULK_FACTOR].freeze

  has_many :product_promotions, dependent: :destroy

  validates :rule_type, presence: true, inclusion: { in: RULE_TYPES }
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
