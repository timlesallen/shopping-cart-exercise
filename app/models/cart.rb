class Cart < ApplicationRecord
  has_many :cart_items

  def total_price
    cart_items.reduce(0) do |sum, item|
      sum + (item.product.price * item.quantity)
    end
  end

  def discount
    discount_factor(self.total_price) * self.total_price
  end

  private
  def discount_factor total
    if total > 100
      0.2
    elsif total > 50
      0.15
    elsif total > 20
      0.1
    else
      0
    end
  end
end
