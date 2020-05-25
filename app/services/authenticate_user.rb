class AuthenticateUser
  def initialize(email:, password:)
    @email = email
    @password = password
  end

  def self.call(email:, password:)
    new(email: email, password: password).call
  end

  def call
    if (user = User.find_by(email: email))
      user.authenticate(password)
    end
  end

  private
  
  attr_reader :email
  attr_reader :password
end
