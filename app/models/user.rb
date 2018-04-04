class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :points
  has_many :user_rewards
  has_many :rewards, through: :user_rewards
  has_secure_password
  enum role: %w(default admin)

  def update_points
    update_attributes(available_points: (available_points + 1))
  end

  def change_point_values(amount)
    decrement!(:available_points, amount)
    increment!(:redeemed_points, amount)
  end
end
