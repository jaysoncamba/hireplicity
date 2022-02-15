class User < ApplicationRecord
  has_secure_password

  include EmailValidatable
  validates :email, email: true
  validates :email, presence: true, uniqueness: true
  #validates :password, presence

  def welcome
    "Welcome!! #{email}"
  end
end
