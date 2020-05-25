class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def new
  end

  def create
    auth = AuthenticateUser.new(email: session_params[:email], password: session_params[:password])
    if (user = auth.call)
      session[:user_id] = user.id
      redirect_to root_path
    else
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
