class UsersController < ApplicationController
  before_action :redirect_if_user_not_authorized, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # Probably store the :message inside the flash, because we are going to redirect to a different page
      flash[:message] = "Success! Your account was created"
      redirect_to @user
    else
      flash.now[:message] = "Please try again"
      render action: 'new'
    end
  end

  def show
    @user = User.find(params[:id])

    @strain = Strain.new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def redirect_if_user_not_authorized
    unless authorized?(params[:id].to_i)
      flash[:message] = "You are not authorized to see that page."
      redirect_to login_path
    end
  end
end
