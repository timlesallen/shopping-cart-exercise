require 'test_helper'

class CartItemControllerTest < ActionDispatch::IntegrationTest
  test "should create cart item" do
    assert_difference('CartItem.count') do
      post cart_items_url, params: { uuid: Product.first.uuid }
    end
    assert_redirected_to('/')
  end
end
