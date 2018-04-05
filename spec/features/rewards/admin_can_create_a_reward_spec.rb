require 'rails_helper'

describe 'Admin' do
  describe 'completes new reward form and clicks submit' do
    it 'they create a new reward' do
      admin = User.create!(username: 'hmesander', password: 'test', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_rewards_path

      click_on 'Add a Reward'

      expect(current_path).to eq(new_admin_reward_path)

      fill_in 'Title', with: 'Phone Time'
      fill_in 'Value', with: 40
      fill_in 'Description', with: 'Awesome!'

      click_on 'Create Reward'

      expect(current_path).to eq(admin_rewards_path)
      expect(page).to have_content('Phone Time')
      expect(page).to have_content(40)
    end
  end
end
