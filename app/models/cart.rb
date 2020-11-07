class Cart < ApplicationRecord
  has_many :cart_items

  def total_price
    cart_items.reduce(0) do |sum, item|
      sum + (item.product.price * item.quantity)
    end
  end

  def find_discount
    total = self.total_price
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
