require 'rails_helper'

RSpec.describe ProductPromotion, type: :model do
  let(:product_promotion) { build(:product_promotion) }

  it 'Create product promotion' do
    expect(product_promotion).to be_valid
    expect(product_promotion.product).to be_present
    expect(product_promotion.promotion_rule).to be_present
  end
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
