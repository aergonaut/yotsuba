# typed: strict
class User < ApplicationRecord
  has_secure_password validations: false

  has_many :islands

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }

  # user passwords are optional
  validates_length_of :password, minimum: 8, maximum: ActiveModel::SecurePassword::MAX_PASSWORD_LENGTH_ALLOWED, allow_blank: true
  validates_confirmation_of :password, allow_blank: true

  def to_token
    payload =
      {
        sub: id,
        exp: 1.day.from_now.to_i
      }
    JWT.encode(payload, Rails.application.credentials.jwt_secret_key, "HS256")
  end

  def self.from_token(token)
    begin
      payload, _ = JWT.decode(token, Rails.application.credentials.jwt_secret_key, true, algorithm: "HS256")
      find_by(id: payload["sub"])
    rescue JWT::DecodeError
      nil
    end
  end
end
