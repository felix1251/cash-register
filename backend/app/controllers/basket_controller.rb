class BasketController < ApplicationController
  def calculate
    pricing = PricingService.new(params[:basket])
    render json: pricing.calculate
  end
end
