class UsersController < ApplicationController
  before_action :logged_in_users, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user
  
  def index
    @users = User.page params[:page]
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
      redirect_back_or (@user), flash: { success: "welcome to the Sample App!" } 
  	else 
      redirect_to new_user_path, flash: { danger: @user.errors }
  	end
  end

  def edit

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, flash: {success: "attributes updated"}
    else
      redirect_to edit_user_path
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "You have successfully deleted User"
    redirect_to users_url
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in_users
    unless logged_in?
      store_location
      redirect_to login_path, flash: { danger: "Please log in"}
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to (root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
