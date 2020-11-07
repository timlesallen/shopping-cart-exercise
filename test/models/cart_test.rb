require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "total_price is zero for empty cart" do
    assert Cart.new(cart_items: []).total_price === 0
  end
end
