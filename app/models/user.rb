class User < ActiveRecord::Base

  has_secure_password
  validates :email, presence: true, :uniqueness => {:case_sensitive => false}, format: { with: /\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}/ }
  validates :first_name, :last_name, presence: true
  validates :password,
    presence: true,
    length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    # If the user exists AND the password entered is correct.
    
    user = User.find_by_email(email.strip)
    user && user.authenticate(password.strip)
  end
end
