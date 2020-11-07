class Cart < ApplicationRecord
  has_many :cart_items

  def total_price
    0
  end
end
