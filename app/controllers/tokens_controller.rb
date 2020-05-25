class TokensController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_user

  def create
    auth = AuthenticateUser.new(email: params[:email], password: params[:password])
    if (user = auth.call)
      head :created, authorization: "Bearer #{user.to_token}"
    else
      head :not_found
    end
  end
end
