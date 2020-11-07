class Cart < ApplicationRecord
  has_many :cart_items

  def total_price
    100
  end
end
