require 'rails_helper'

describe 'User' do
  describe 'visits another user dashboard' do
    it 'they see a 404 message' do
      user1 = User.create!(username: 'Haley', password: 'test')
      user2 = User.create!(username: 'Lauren', password: 'test')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

      user1.points.create!(number: 5)
      user2.points.create!(number: 10)

      visit user_path(user2)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
