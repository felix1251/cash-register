class Product < ApplicationRecord
  validates :name, :code, :base_price, presence: true
  validates :code, uniqueness: true
end
