require 'rails_helper'

describe 'User' do
  describe 'visits another user dashboard' do
    it 'they see a 404 message' do
      user1 = User.create!(username: 'Haley', password: 'test')
      user2 = User.create!(username: 'Lauren', password: 'test')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

      point1 = user1.points.create!(status: 'active')
      point2 = user1.points.create!(status: 'active')
      point3 = user2.points.create!(status: 'active')
      point4 = user2.points.create!(status: 'active')

      visit user_path(user2)

      expect(current_path).to eq(root_path)
    end
  end
end
