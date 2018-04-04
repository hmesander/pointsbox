class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :points
  has_many :bought_rewards
  has_many :rewards, through: :bought_rewards
  has_secure_password
  enum role: %w(default admin)
end
