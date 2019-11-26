class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :logged_in?


    def redirect_if_not_found
    end
    
end
