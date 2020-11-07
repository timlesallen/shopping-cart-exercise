class CartsController < ApplicationController
  # Show the current cart as well as the available products
  def index
    @products = Product.all
    discount = @current_cart.find_discount
    @discount = discount[:description] if discount
  end
end
