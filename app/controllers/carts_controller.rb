class CartsController < ApplicationController
  # Show the current cart as well as the available products
  def index
    @products = Product.all
    discount = @current_cart.find_discount
    if discount then
      @discount = discount[:description]
    end
  end
end
