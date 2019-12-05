class CartsController < ApplicationController
  before_action :logged_in?, only: [:show, :destroy]



  def show
    @order_items = current_order.order_items
  end

  def destroy 
    @cart = @current_cart 
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil 
    redirect_to root_path
  end

  private 

  def set_cart 
    params.fetch(:cart, {})
  end

  def cart_params
    params.require(:cart).permit(:user_id)
  end
  
end
