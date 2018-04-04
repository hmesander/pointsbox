class Point < ApplicationRecord
  validates_presence_of :user_id, :status

  enum status: [:active, :redeemed]
  enum keep: [:keep, :eliminate]

end
