class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

  def redirect_if_logged_in
    redirect_to root_path if current_user
  end
end
