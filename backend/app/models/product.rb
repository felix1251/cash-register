class Product < ApplicationRecord
  has_many :product_promotions

  validates :name, :code, :base_price, presence: true
  validates :code, uniqueness: true
end
