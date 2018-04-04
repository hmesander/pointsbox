require 'rails_helper'

describe 'Admin' do
  describe 'visits dashboard' do
    it 'they assign points to a user' do
      admin = User.create!(username: 'Haley', password: 'test', role: 1)
      user = User.create!(username: 'Emily', password: 'test')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path

      click_on "Assign Points to #{user.username}"

      expect(current_path).to eq(new_admin_point_path)

      select(user.username, :from => 'User')
      fill_in "Number of Points", with: 30
      click_on 'Assign Points'

      expect(current_path).to eq(admin_users_path)
      expect(page).to have_content("Total Points: 30")
    end
  end
end
