require 'rails_helper'

describe 'Admin' do
  describe 'completes edit reward form and clicks submit' do
    it 'they update a reward' do
      admin = User.create!(username: 'hmesander', password: 'test', role: 1)
      reward = Reward.create!(title: 'Phone Time')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_rewards_path

      within(".#{reward.title}") do
        click_on 'Update Reward'
      end

      expect(current_path).to eq(edit_admin_reward_path)

      fill_in 'Title', with: 'Free Time'
      click_on 'Update Reward'

      expect(current_path).to eq(rewards_path)
      expect(page).to_not have_content('Phone Time')
      expect(page).to have_content('Free Time')
    end
  end
end
