class User < ActiveRecord::Base
  #This is the line of code that gives our User model authentication methods via bcrypt.
  has_secure_password

  has_many :reviews
  has_many :orders

  # validates_uniqueness_of :email, case_sensitive: false, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: {within: 6..15}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials email, password
    user = User.find_by_email(email.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
