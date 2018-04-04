require 'rails_helper'

describe 'Guest' do
  describe 'visits user dashboard' do
    it 'they see a 404 message' do
      user = User.create!(username: 'Haley', password: 'test')
      point1 = user.points.create!(status: 'active')
      point2 = user.points.create!(status: 'active')
      point3 = user.points.create!(status: 'active')
      point4 = user.points.create!(status: 'active')

      visit user_path(user)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
