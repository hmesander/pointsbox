class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :points
  has_secure_password
  enum role: %w(default admin)

  def total_points
    points.count
  end
end
