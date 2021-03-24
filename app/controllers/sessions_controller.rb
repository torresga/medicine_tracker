class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      reset_session
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.now[:message] = "You are not being authenticated"
      render 'new'
    end
  end

  def destroy
    reset_session
    render 'new'
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
