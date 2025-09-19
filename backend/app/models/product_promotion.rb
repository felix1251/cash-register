class ProductPromotion < ApplicationRecord
  belongs_to :product
  belongs_to :promotion_rule
end
