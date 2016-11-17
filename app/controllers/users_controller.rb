class UsersController < ApplicationController
  def new
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to posts_path
    else 
      redirect_to signup_path
    end 
  end 

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end 
  
end 

