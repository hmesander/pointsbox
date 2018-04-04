class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :points
  has_many :rewards
  has_secure_password
  enum role: %w(default admin)

  def total_points
    points.sum(:number)
  end
end
