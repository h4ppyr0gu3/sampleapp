class SessionsController < ApplicationController

  # layout 'custom'
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
      flash.now[:success] = "You are succesfully logged in"
  	else
  	  redirect_to login_path, flash: { danger: "Invalid email/password combination" }
    end
  end

  def destroy
    # user = User.find_by(id: params[:id])
    # session[:user_id] = nil
    log_out if logged_in?
    redirect_to root_path, flash: { success: "You have succesfully logged out" }
  end
end
