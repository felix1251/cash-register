require "rails_helper"

RSpec.describe ProductsController, type: :controller do
  describe "GET /products" do
    before do
      create(:product, :gr1)
      create(:product, :sr1)
      create(:product, :cf1)
    end

    it "Product list" do
      get :index, as: :json
      expect(response).to have_http_status(:ok)

      data = JSON.parse(response.body)

      expect(data).to be_an(Array)
      expect(data).not_to be_empty
      expect(data.size).to eq(3)
    end
  end
end
