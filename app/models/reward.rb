class Reward < ApplicationRecord
  validates_presence_of :title, :value, :description, :image
end
