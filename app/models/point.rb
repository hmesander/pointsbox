class Point < ApplicationRecord
  validates_presence_of :user_id, :status
  belongs_to :user
  enum status: [:active, :redeemed]
end
