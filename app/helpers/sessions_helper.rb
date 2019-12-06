module SessionsHelper


    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        #!current_user.nil?
        unless User.find_by(id:session[:user_id])
            redirect_to login_url, notice:"please log in:)"
        end
    end

    def admin_user?
        current_user && current_user.role == '1'
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
        reset_session
    end
    

end
