require 'rails_helper'

describe 'Admin' do
  describe 'visits users index page' do
    it 'they create a new user' do
      admin = User.create!(username: 'Admin', password: 'test', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path

      click_on 'Create a New User'

      expect(current_path).to eq(new_user_path)

      fill_in 'Username', with: 'babydoe'
      fill_in 'Password', with: 'test'

      click_on 'Create User'

      expect(current_path).to eq(admin_users_path)

      expect(page).to have_content('babydoe')
    end
  end
end
