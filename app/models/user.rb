class User < ApplicationRecord
  
  before_save { self.email = email.downcase } 

  validates :name, presence: true, 
  uniqueness: { case_sensitive: false },  
  length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, 
  uniqueness: { case_sensitive: false },
  length: { maximum: 255 },
  format: {with: VALID_EMAIL_REGEX}

  validates :password, presence: true, length: { minimum: 6 } 

  has_secure_password


  #This code is only to help test code in the (integration/users_login_test.rb) it test to see if the links that should appear shows up when user sign in like "Account, users etc" show up and links that should hide like "login" stay hidden
  # Returns the hash digest of the given string.
  def User.digest(string)
  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  BCrypt::Engine.cost
  BCrypt::Password.create(string, cost: cost)
  end
end
