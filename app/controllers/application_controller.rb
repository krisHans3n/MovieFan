class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :logged_in?
    helper_method :current_order


    def current_order 
        
        if session[:order_id].nil? 
            Order.new 
        else 
            Order.find(session[:order_id])
        end

    end
    
    
end
