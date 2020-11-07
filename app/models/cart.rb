class Cart < ApplicationRecord
  has_many :cart_items

  # total price without any discounts applied
  def total_price
    cart_items.reduce(0) do |sum, item|
      sum + (item.product.price * item.quantity)
    end
  end

  # total price adjusted by any applicable discount
  def discounted_price
    discount = find_discount
    return total_price unless discount

    (total_price * (1 - discount[:factor])).round(2)
  end

  # find any discount that applies, false if none
  def find_discount
    total = total_price
    if total > 100
      { description: '20% off on total greater than $100', factor: 0.2 }
    elsif total > 50
      { description: '15% off on total greater than $50', factor: 0.15 }
    elsif total > 20
      0.1
      { description: '10% off on total greater than $20', factor: 0.1 }
    else
      false
    end
  end
end
