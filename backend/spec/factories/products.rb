FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    code { Faker::Code.nric }
    base_price { Faker::Commerce.price }

    trait :gr1 do
      name { "Green Tea" }
      code { "GR1" }
      base_price { 3.11 }
    end

    trait :sr1 do
      name { "Strawberry" }
      code { "SR1" }
      base_price { 5.00 }
    end

    trait :cf1 do
      name { "Coffe" }
      code { "CF1" }
      base_price { 11.23 }
    end
  end
end

# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  base_price :decimal(10, 2)   not null
#  code       :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_products_on_code  (code) UNIQUE
#
