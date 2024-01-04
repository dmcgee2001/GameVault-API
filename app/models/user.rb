class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_secure_password
  has_many :collections
  has_many :games, through: :collections
  has_many :reviews
end
