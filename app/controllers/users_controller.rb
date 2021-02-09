require 'byebug'
class UsersController < ApplicationController
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
      redirect_to user_path(@user), flash: { success: "welcome to the Sample App!" } 
  	else 
      redirect_to new_user_path, flash: { danger: @user.errors }
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
