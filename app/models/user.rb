class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true , length: {maximum: 100}
  validates :last_name, presence: true, length: {maximum: 100}
  validates :email, presence: true, length: {maximum: 255},confirmation: true
  validates :email_confirmation, presence: true
  validates :password , length: {minimum: 6,maximum: 8}
  validates :password_confirmation,presence: true
  validates :gender, presence: true
  validates :birthday, presence: true
end
