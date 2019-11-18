class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    def cart_order
        if session[:orders_id]
            Order.find(session[:orders_id])
        else 
            Order.new
        end
    end
    
end
