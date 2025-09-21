class Product < ApplicationRecord
  has_many :product_promotions, dependent: :destroy
  has_many :promotion_rules, through: :product_promotions, dependent: :destroy

  validates :name, :code, :base_price, presence: true
  validates :code, uniqueness: true
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
