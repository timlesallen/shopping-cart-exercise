class CartItemsController < ApplicationController
  def create
    product = Product.find_by(uuid: params[:uuid])
    existing = CartItem.find_by(product: product, cart: @current_cart)
    if (existing) then
      puts existing
      existing.quantity += 1
      existing.save
    else
      CartItem.create(product: product, cart: @current_cart)
    end
    redirect_to '/'
  end
  def destroy
    CartItem.find(params[:id]).destroy
    redirect_to '/'
  end
end
