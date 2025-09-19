require 'rails_helper'

RSpec.describe PricingService, type: :model do
  describe 'test pricing service' do
    let(:gr1) { create(:product, :gr1) }
    let(:sr1) { create(:product, :sr1) }
    let(:cf1) { create(:product, :cf1) }

    let(:bogo) { create(:promotion_rule, :bogo) }
    let(:bulk_fixed) { create(:promotion_rule, :bulk_fixed) }
    let(:bulk_factor) { create(:promotion_rule, :bulk_factor) }

    let!(:gr1_bogo) { create(:product_promotion, product: gr1, promotion_rule: bogo) }
    let!(:sr1_bulk_fixed) { create(:product_promotion, product: sr1, promotion_rule: bulk_fixed) }
    let!(:cf1_bulk_factor) { create(:product_promotion, product: cf1, promotion_rule: bulk_factor) }

    it 'test: GR1,SR1,GR1,GR1,CF1' do
      pricing = PricingService.new("GR1,SR1,GR1,GR1,CF1")
      puts pricing.calculate
    end
  end
end
