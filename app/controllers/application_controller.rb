class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :logged_in?
    helper_method :current_order


    def current_order 
        if session[:order_id]
            Order.find(session[:order_id])
        else
            Order.new
        end

    end
    
    
end
