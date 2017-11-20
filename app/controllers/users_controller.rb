class UsersController < ApplicationController
  def my_portfolio
  end
  
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to root_url, :notices => "Signed up!"
  	else
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, :notice => "Logged out!"
  end

  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
