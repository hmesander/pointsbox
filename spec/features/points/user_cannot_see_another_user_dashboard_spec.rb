require 'rails_helper'

describe 'User' do
  describe 'visits another user dashboard' do
    it 'they see a 404 message' do
      user1 = User.create!(username: 'Haley', password: 'test')
      user2 = User.create!(username: 'Lauren', password: 'test')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

      user1.points.create!
      user2.points.create!

      visit user_path(user2)

      expect(page).to have_content("The page you were looking for doesn't exist.")

      visit user_path(user1)

      expect(page).to have_content("Welcome, #{user1.username}!")
    end
  end
end
