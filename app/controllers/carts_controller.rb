class CartsController < ApplicationController
  def index
    @products = Product.all
    discount = @current_cart.find_discount
    if discount then
      @discount = discount[:description]
    end
  end
end
