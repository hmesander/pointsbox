require 'rails_helper'

describe 'User' do
  describe 'is not logged in and visits their dashboard' do
    it 'they see a 404 message' do
      user1 = User.create!(username: 'Haley', password: 'test')

      visit user_path(user1)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
