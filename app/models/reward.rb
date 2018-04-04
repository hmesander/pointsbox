class Reward < ApplicationRecord
  validates_presence_of :title, :value, :description, :image
  belongs_to :user
end
