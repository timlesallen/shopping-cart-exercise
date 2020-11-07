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

  test "discount of 10% applied for > $20" do
    assert Cart.new(cart_items: [
        CartItem.new(product: Product.new(price: 30))
    ]).discount === 3
  end

  test "discount of 15% applied for > $50" do
    assert Cart.new(cart_items: [
        CartItem.new(product: Product.new(price: 60))
    ]).discount === 9
  end

  test "discount of 20% applied for > $100" do
    assert Cart.new(cart_items: [
        CartItem.new(product: Product.new(price: 120))
    ]).discount === 24
  end
end
