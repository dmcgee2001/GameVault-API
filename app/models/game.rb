class Game < ApplicationRecord
  has_many :collections
  has_many :users, through: :collections
end
