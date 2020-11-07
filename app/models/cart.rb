class Cart < ApplicationRecord
  has_many :cart_items

  def total_price
    cart_items.reduce(0) do |sum, item|
      sum + (item.product.price * item.quantity)
    end
  end
end
