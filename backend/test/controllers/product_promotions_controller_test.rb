require "test_helper"

class ProductPromotionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_promotion = product_promotions(:one)
  end

  test "should get index" do
    get product_promotions_url, as: :json
    assert_response :success
  end

  # test "should create product_promotion" do
  #   assert_difference("ProductPromotion.count") do
  #     post product_promotions_url, params: { product_promotion: { product_id: @product_promotion.product_id, promotion_rule_id: @product_promotion.promotion_rule_id } }, as: :json
  #   end
  #
  #   assert_response :created
  # end

  test "should show product_promotion" do
    get product_promotion_url(@product_promotion), as: :json
    assert_response :success
  end

  # test "should update product_promotion" do
  #   patch product_promotion_url(@product_promotion), params: { product_promotion: { product_id: @product_promotion.product_id, promotion_rule_id: @product_promotion.promotion_rule_id } }, as: :json
  #   assert_response :success
  # end

  test "should destroy product_promotion" do
    assert_difference("ProductPromotion.count", -1) do
      delete product_promotion_url(@product_promotion), as: :json
    end

    assert_response :no_content
  end
end
