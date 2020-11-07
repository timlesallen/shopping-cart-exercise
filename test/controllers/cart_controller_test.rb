require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get carts_index_url
    assert_response :success
  end
end
