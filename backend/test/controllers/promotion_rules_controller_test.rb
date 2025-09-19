require "test_helper"

class PromotionRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @promotion_rule = promotion_rules(:one)
  end

  test "should get index" do
    get promotion_rules_url, as: :json
    assert_response :success
  end

  # test "should create promotion_rule" do
  #   assert_difference("PromotionRule.count") do
  #     post promotion_rules_url, params: { promotion_rule: { description: @promotion_rule.description, discount_value: @promotion_rule.discount_value, min_quantity: @promotion_rule.min_quantity, priority: @promotion_rule.priority, rule_type: @promotion_rule.rule_type } }, as: :json
  #   end
  #
  #   assert_response :created
  # end

  test "should show promotion_rule" do
    get promotion_rule_url(@promotion_rule), as: :json
    assert_response :success
  end

  test "should update promotion_rule" do
    patch promotion_rule_url(@promotion_rule), params: { promotion_rule: { description: @promotion_rule.description, discount_value: @promotion_rule.discount_value, min_quantity: @promotion_rule.min_quantity, priority: @promotion_rule.priority, rule_type: @promotion_rule.rule_type } }, as: :json
    assert_response :success
  end

  test "should destroy promotion_rule" do
    assert_difference("PromotionRule.count", -1) do
      delete promotion_rule_url(@promotion_rule), as: :json
    end

    assert_response :no_content
  end
end
