# typed: strong
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user

  protected

  def authenticate_user
    unless current_user
      redirect_to new_session_path
    end
  end

  def current_user
    if (user = User.find_by(id: session[:user_id]))
      user
    else
      session[:user_id] = nil
      nil
    end
  end
end
