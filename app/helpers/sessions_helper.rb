module SessionsHelper


    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def not_admin? 
        unless admin_user? 
            redirect_to movies_path
        end
    end

    def current_user?
        @current_user
    end


    def logged_in?
        #!current_user.nil?
        unless User.find_by(id:session[:user_id])
            redirect_to login_url, notice:"Incorrect Details, please try again"
        end
    end

    def admin_user?
        current_user && current_user.role == "admin"
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
        reset_session
    end
    

end
