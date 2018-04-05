class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :points, dependent: :destroy
  has_many :user_rewards, dependent: :destroy
  has_many :rewards, through: :user_rewards
  has_secure_password
  enum role: %w(default admin)

  def total_points
    points.count
  end

  def subtract_points(value)
    value.times do
      points.last.destroy
    end
  end
end
