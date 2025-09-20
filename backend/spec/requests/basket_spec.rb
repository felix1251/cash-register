require "rails_helper"

RSpec.describe BasketController, type: :controller do
  describe "POST /basket" do
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

    it "Params Empty" do
      expect { post :calculate }.to raise_error(ActionController::ParameterMissing, /basket/)
      expect { post :calculate, params: {} }.to raise_error(ActionController::ParameterMissing, /basket/)
      expect { post :calculate, params: { basket: "" } }.to raise_error(ActionController::ParameterMissing, /basket/)
    end

    it "Params: GR1,SR1,GR1,GR1,CF1" do
      post :calculate, params: { basket: "GR1,SR1,GR1,GR1,CF1" }, as: :json
      expect(response).to have_http_status(:ok)

      expect(JSON.parse(response.body)["total"]).to eq(22.45)
    end

    it "Params: GR1,GR1" do
      post :calculate, params: { basket: "GR1,GR1" }, as: :json
      expect(response).to have_http_status(:ok)

      expect(JSON.parse(response.body)["total"]).to eq(3.11)
    end

    it "Params: GR1,GR1" do
      post :calculate, params: { basket: "GR1,GR1" }, as: :json
      expect(response).to have_http_status(:ok)

      expect(JSON.parse(response.body)["total"]).to eq(3.11)
    end

    it "Params: GR1,CF1,SR1,CF1,CF1" do
      post :calculate, params: { basket: "GR1,CF1,SR1,CF1,CF1" }, as: :json
      expect(response).to have_http_status(:ok)

      expect(JSON.parse(response.body)["total"]).to eq(30.57)
    end
  end
end
