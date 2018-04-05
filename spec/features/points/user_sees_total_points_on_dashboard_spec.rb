require 'rails_helper'

describe 'User' do
  describe 'visits user dashboard' do
    it 'they see their total assigned points' do
      user = User.create!(username: 'Haley', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      5.times do
        user.points.create!
      end

      visit user_path(user)

      expect(page).to have_content("Welcome, #{user.username}!")
      expect(page).to have_content('Total Points: 5')
    end
  end
end
