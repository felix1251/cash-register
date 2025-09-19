class PromotionRulesController < ApplicationController
  before_action :set_promotion_rule, only: %i[ show update destroy ]

  # GET /promotion_rules
  def index
    @promotion_rules = PromotionRule.all

    render json: @promotion_rules
  end

  # GET /promotion_rules/1
  def show
    render json: @promotion_rule
  end

  # POST /promotion_rules
  def create
    @promotion_rule = PromotionRule.new(promotion_rule_params)

    if @promotion_rule.save
      render json: @promotion_rule, status: :created, location: @promotion_rule
    else
      render json: @promotion_rule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /promotion_rules/1
  def update
    if @promotion_rule.update(promotion_rule_params)
      render json: @promotion_rule
    else
      render json: @promotion_rule.errors, status: :unprocessable_entity
    end
  end

  # DELETE /promotion_rules/1
  def destroy
    @promotion_rule.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promotion_rule
      @promotion_rule = PromotionRule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def promotion_rule_params
      params.require(:promotion_rule).permit(:rule_type, :min_quantity, :discount_value, :description, :priority)
    end
end
