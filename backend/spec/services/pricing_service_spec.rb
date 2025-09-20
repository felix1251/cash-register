require 'rails_helper'

RSpec.describe PricingService, type: :model do
  describe 'Testing pricing service' do
    let(:gr1) { create(:product, :gr1) }
    let(:sr1) { create(:product, :sr1) }
    let(:cf1) { create(:product, :cf1) }

    let(:bogo) { create(:promotion_rule, :bogo) }
    let(:bulk_fixed) { create(:promotion_rule, :bulk_fixed) }
    let(:bulk_factor) { create(:promotion_rule, :bulk_factor) }

    before do
      create(:product_promotion, product: gr1, promotion_rule: bogo)
      create(:product_promotion, product: sr1, promotion_rule: bulk_fixed)
      create(:product_promotion, product: cf1, promotion_rule: bulk_factor)
    end

    it 'GR1,SR1,GR1,GR1,CF1' do
      pricing = PricingService.new("GR1,SR1,GR1,GR1,CF1")
      expect(pricing.calculate[:total]).to eq(22.45)
    end

    it 'GR1,GR1' do
      pricing = PricingService.new("GR1,GR1")
      expect(pricing.calculate[:total]).to eq(3.11)
    end

    it 'GR1,CF1,SR1,CF1,CF1' do
      pricing = PricingService.new("GR1,CF1,SR1,CF1,CF1")
      expect(pricing.calculate[:total]).to eq(30.57)
    end
  end
end
