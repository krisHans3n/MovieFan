class ApplicationController < ActionController::Base
    #before_action :authenticate_user! #unblock this after changes made

    def cart_order
        if session[:orders_id]
            Order.find(session[:orders_id])
        else 
            Order.new
        end
    end
    
end
