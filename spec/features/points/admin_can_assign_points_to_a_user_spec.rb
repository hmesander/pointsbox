require 'rails_helper'

describe 'Admin' do
  describe 'visits admin user path' do
    it 'they assign points to a user' do
      admin = User.create!(username: 'Haley', password: 'test', role: 1)
      user = User.create!(username: 'Emily', password: 'test')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path

      click_on user.username

      expect(current_path).to eq(admin_user_path(user))

      click_on "Assign Point to #{user.username}"

      expect(current_path).to eq(admin_user_path(user))
      expect(page).to have_content("Total Points: 1")
    end
  end
end
