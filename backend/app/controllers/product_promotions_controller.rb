class ProductPromotionsController < ApplicationController
  before_action :set_product_promotion, only: %i[ show update destroy ]

  # GET /product_promotions
  def index
    @product_promotions = ProductPromotion.all

    render json: @product_promotions
  end

  # GET /product_promotions/1
  def show
    render json: @product_promotion
  end

  # POST /product_promotions
  def create
    @product_promotion = ProductPromotion.new(product_promotion_params)

    if @product_promotion.save
      render json: @product_promotion, status: :created, location: @product_promotion
    else
      render json: @product_promotion.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /product_promotions/1
  def update
    if @product_promotion.update(product_promotion_params)
      render json: @product_promotion
    else
      render json: @product_promotion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /product_promotions/1
  def destroy
    @product_promotion.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_promotion
      @product_promotion = ProductPromotion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_promotion_params
      params.require(:product_promotion).permit(:product_id, :promotion_rule_id)
    end
end
