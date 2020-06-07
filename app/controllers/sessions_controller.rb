class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
  end

  def create
    auth = build_auth
    if (user = auth.call)
      session[:user_id] = user.id
      flash[:success] = "Successfully signed in."
      redirect_to root_path
    else
      flash[:warning] = "A user with that email and password combination could not be found."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "You have been signed out."
    redirect_to root_path
  end

  private

  def build_auth
    if request.env["omniauth.auth"]
      OmniauthAuthenticate.new(auth: request.env["omniauth.auth"])
    else
      AuthenticateUser.new(email: session_params[:email], password: session_params[:password])
    end
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def redirect_if_logged_in
    redirect_to root_path if current_user
  end
end
