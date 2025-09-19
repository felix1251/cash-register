class PricingService
  def initialize(items_str)
    @cart_items = items_str.split(",").tally.map { |code, qty| { code: code, quantity: qty } }
    product_codes = @cart_items.map { |item| item[:code] }

    @products = Product.includes(:product_promotions)
                       .where(code: product_codes)
                       .index_by(&:code)
  end

  def calculate
    items = @cart_items.map do |item|
      product = @products[item[:code]]
      quantity = item[:quantity]

      promotions = product.product_promotions
      # Implement priority
      # promotions = product.product_promotions.joins(:promotion_rule).order("promotion_rules.priority")

      final_price = if promotions.any?
                      apply_rules(product, quantity, promotions)
      else
                      product.base_price * quantity
      end

      {
        code: product.code,
        name: product.name,
        quantity: quantity,
        unit_price: product.base_price,
        final_price: final_price.round(2)
      }
    end

    {
      items: items,
      total: items.sum { |i| i[:final_price] }.round(2)
    }
  end

  private

  def apply_rules(product, quantity, promotions)
    promotions.each do |promo|
      rule = promo.promotion_rule
      case rule.rule_type
      when "BOGO"
        chargeable_quantity = (quantity / rule.min_quantity) * (rule.min_quantity - rule.discount_value) +
                              (quantity % rule.min_quantity)
        return chargeable_quantity * product.base_price

      when "BULK_FIXED"
        return quantity * rule.discount_value if quantity >= rule.min_quantity

      when "BULK_FACTOR"
        return quantity * (product.base_price * rule.discount_value) if quantity >= rule.min_quantity
      end
    end

    product.base_price * quantity
  end
end
