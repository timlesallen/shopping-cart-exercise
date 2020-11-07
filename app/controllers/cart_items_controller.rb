class CartItemsController < ApplicationController
  def create
    product = Product.find_by(uuid: params[:uuid])
    CartItem.create(product: product, cart: @current_cart)
    redirect_to '/'
  end
  def destroy
    CartItem.find(params[:id]).destroy
    redirect_to '/'
  end
end
