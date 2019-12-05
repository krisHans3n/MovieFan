class CartsController < ApplicationController
  before_action :logged_in?, only: [:show, :destroy]



  def show
    @order_items = current_order.order_items
  end

  def destroy 
    @cart = @current_cart 
    @cart.destroy 
    session[:cart_id] = nil 
    redirect_to root_path
  end

  private 

  def cart_params
    params.require(:cart).permit(:user_id)
  end
  
end
