class OmniauthAuthenticate
  def initialize(auth:)
    @auth = auth
  end

  def self.call(auth:)
    new(auth: auth).call
  end

  def call
    email = auth.info.email
    user = User.find_or_initialize_by(email: email)
    if user.new_record?
      user.username = auth.info.name
      user.save
    end
    user
  end

  private

  attr_reader :auth
end
