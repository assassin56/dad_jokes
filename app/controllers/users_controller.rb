class UsersController < ApplicationController
  def new 
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You've successfully signed up!"
      session[:user_id] = @user.user_id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem signing up. Don't use 'beef stew' as a computer password. It's not stroganoff."
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end