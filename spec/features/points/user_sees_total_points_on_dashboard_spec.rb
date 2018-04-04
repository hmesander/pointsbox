require 'rails_helper'

describe 'User' do
  describe 'visits user dashboard' do
    it 'they see their total assigned points' do
      user = User.create!(username: 'Haley', password: 'test', available_points: 3)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      expect(page).to have_content("Welcome, #{user.username}!")
      expect(page).to have_content('Available Points: 3')
    end
  end
end
