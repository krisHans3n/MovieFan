class SessionsController < ApplicationController
  skip_before_action :logged_in?


  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) 
      log_in(user)
      if admin_user? 
        redirect_to admin_url
      else
        redirect_to user
      end    
    else
     flash[:notice] = "Invalid email/password combination"
      redirect_to users_path
    end
  end

  #removes the session when user logs-out
  def destroy
     log_out
     redirect_to root_url
end



end
