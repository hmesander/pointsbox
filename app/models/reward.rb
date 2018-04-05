class Reward < ApplicationRecord
  validates_presence_of :title, :value, :description, :image
  has_many :user_rewards, dependent: :destroy
  has_many :users, through: :user_rewards
end
