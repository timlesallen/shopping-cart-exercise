require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test 'total_price is zero for empty cart' do
    assert_equal(0, Cart.new(cart_items: []).total_price)
  end

  test 'total_price is correct for populated cart' do
    assert_equal(
      204.02,
      Cart.new(cart_items: [
                 CartItem.new(product: Product.new(price: 101.01), quantity: 2),
                 CartItem.new(product: Product.new(price: 2.00))
               ]).total_price
    )
  end

  test 'no discount applied <= $20' do
    assert_equal(
      false,
      cart_with_price(20.00).find_discount
    )
    assert_equal(
      20,
      cart_with_price(20.00).discounted_price
    )
  end

  test 'discount of 10% applied for > $20' do
    assert_equal(
      { description: '10% off on total greater than $20', factor: 0.1 },
      cart_with_price(20.01).find_discount
    )
    assert_equal(
      18.01,
      cart_with_price(20.01).discounted_price
    )
  end

  test 'discount of 15% applied for > $50' do
    assert_equal(
      { description: '15% off on total greater than $50', factor: 0.15 },
      cart_with_price(50.01).find_discount
    )
    assert_equal(
      42.51,
      cart_with_price(50.01).discounted_price
    )
  end

  test 'discount of 20% applied for > $100' do
    assert_equal(
      { description: '20% off on total greater than $100', factor: 0.2 },
      cart_with_price(100.01).find_discount
    )
    assert_equal(
      80.01,
      # For some reason, the BigDecimal and Float values are not seen as equal here
      cart_with_price(100.01).discounted_price.to_f
    )
  end
end
