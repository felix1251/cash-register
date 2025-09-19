FactoryBot.define do
  factory :promotion_rule do
    rule_type { Faker::Types.rb_string }
    description { Faker::String.random }
    discount_value { Faker::Number.decimal(l_digits: 2) }
    min_quantity { Faker::Number.non_zero_digit }
  end

  trait :bogo do
    rule_type { "BOGO" }
    description { "Buy 1 Get 1 Free" }
    discount_value { 1 }
    min_quantity { 2 }
  end

  trait :bulk_fixed do
    rule_type { "BULK_FIXED" }
    description { "Buy 3+ at $0.50 each" }
    discount_value { 4.50 }
    min_quantity { 3 }
  end

  trait :bulk_factor do
    rule_type { "BULK_FACTOR" }
    description { "Buy 3+ at 2/3 of base price" }
    discount_value { 0.66666666667 }
    min_quantity { 3 }
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
