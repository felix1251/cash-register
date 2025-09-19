require 'rails_helper'

RSpec.describe PromotionRule, type: :model do
  let(:promotion_rule) { build(:promotion_rule) }

  it 'Create promotion rule' do
    expect(promotion_rule).to be_valid
    expect(promotion_rule.rule_type).to be_present
    expect(promotion_rule.description).to be_present
    expect(promotion_rule.discount_value).to be_present
    expect(promotion_rule.min_quantity).to be_present
    expect(promotion_rule.priority).to be_present
  end
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
