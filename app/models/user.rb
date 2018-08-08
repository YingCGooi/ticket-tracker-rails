class User < ActiveRecord::Base
  has_many :tickets
  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, presence: true, on: :create, length: { minimum: 3 }
end