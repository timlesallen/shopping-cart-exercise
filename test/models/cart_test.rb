require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "total_price is zero for empty cart" do
    assert Cart.new(cart_items: []).total_price === 0
  end

  test "total_price is correct for populated cart" do
    assert Cart.new(cart_items: [
        CartItem.new(product: Product.new(price: 101.01), quantity: 2),
        CartItem.new(product: Product.new(price: 2.00))
    ]).total_price === 204.02
  end

  test "no discount applied <= $20" do
    assert_equal(
      cart_with_price(20.00).find_discount,
      false
    )
  end

  test "discount of 10% applied for > $20" do
    assert_equal(
      cart_with_price(20.01).find_discount,
      { description: '10% off on total greater than $20', factor: 0.1 }
    )
  end

  test "discount of 15% applied for > $50" do
    assert_equal(
      cart_with_price(50.01).find_discount,
      { description: '15% off on total greater than $50', factor: 0.15 }
    )
  end

  test "discount of 20% applied for > $100" do
    assert_equal(
      cart_with_price(100.01).find_discount,
      { description: '20% off on total greater than $100', factor: 0.2 }
    )
  end
end
