class Point < ApplicationRecord
  validates_presence_of :user_id, :status
end
