# typed: strict
class User < ApplicationRecord
  has_secure_password

  has_many :islands

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :password, length: { minimum: 8 }

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
      payload, _ = JWT.decode(token, Rails.application.credentials.jwt_secret_key, algorithm: "HS256")
      find_by(id: payload["sub"])
    rescue JWT::DecodeError
      nil
    end
  end
end
