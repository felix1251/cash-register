class BasketController < ApplicationController
  def calculate
    pricing = PricingService.new(basket_params)
    render json: pricing.calculate
  end

  private
    # Only allow trusted parameters through.
    def basket_params
      basket = params[:basket]
      raise ActionController::ParameterMissing, :basket if basket.blank?
      basket
    end
end
