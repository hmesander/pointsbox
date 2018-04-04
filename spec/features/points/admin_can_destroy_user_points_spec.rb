require 'rails_helper'

describe 'Admin' do
  describe 'visits dashboard' do
    it 'they destroy user points' do
      admin = User.create!(username: 'Haley', password: 'test', role: 1)
      user = User.create!(username: 'Emily', password: 'test')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit user_path(admin)

      click_on "Assign Points to #{user.username}"

      select(user.username, :from => 'User')
      fill_in "Number of Points", with: 30
      click_on 'Assign Points'

      click_on "Delete Points from #{user.username}"

      expect(current_path).to eq(edit_admin_point_path)

      fill_in "How many points do you want to delete?", with: 20
      click_on 'Delete Points'

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Total Points: 10")
    end
  end
end
