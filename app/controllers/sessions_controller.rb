class SessionsController < ApplicationController
  skip_before_action :logged_in?


  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user) #log+redirect to show
      redirect_to user
    else
     flash[:notice] = "Invalid email/password combination"
      #render 
    end
  end

  #removes the session when user logs-out
  def destroy
     log_out
     redirect_to root_url
end



end
