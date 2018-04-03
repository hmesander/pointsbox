require 'rails_helper'

describe 'User' do
  describe 'visits user dashboard' do
    it 'they see their total assigned points' do
      user = User.create!(username: 'Haley', password: 'test')
      point1 = Point.create!(user: user, status: 'active')
      point2 = Point.create!(user: user, status: 'active')
      point3 = Point.create!(user: user, status: 'active')
      point4 = Point.create!(user: user, status: 'active')

      visit user_path(user)

      expect(page).to have_content("Welcome, #{user.username}!")
      expect(page).to have_content('Total Points: 4')
    end
  end
end
