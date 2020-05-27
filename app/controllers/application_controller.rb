# typed: strong
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user
  before_action :set_ratelimit_headers, if: -> { request.format.json? }
  before_action :set_raven_context

  protected

  def authenticate_user
    unless current_user
      redirect_to new_session_path
    end
  end

  def set_ratelimit_headers
    throttle_data = request.env['rack.attack.throttle_data']['req/ip']
    now = throttle_data[:epoch_time]

    response.set_header('RateLimit-Limit', throttle_data[:limit])
    response.set_header('RateLimit-Remaining', throttle_data[:limit] - throttle_data[:count])
    response.set_header('RateLimit-Reset', (now + (throttle_data[:period] - now % throttle_data[:period])).to_s) 
  end

  def current_user
    @current_user ||=
      if (user = User.find_by(id: session[:user_id]))
        user
      else
        session[:user_id] = nil
        nil
      end
  end
  helper_method :current_user

  def set_raven_context
    Raven.user_context(id: current_user.id) if current_user
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
