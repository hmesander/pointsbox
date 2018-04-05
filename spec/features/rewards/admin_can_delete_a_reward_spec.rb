require 'rails_helper'

describe 'Admin' do
  describe 'clicks delete button on a reward' do
    it 'they delete a reward' do
      admin = User.create!(username: 'hmesander', password: 'test', role: 1)
      user = User.create!(username: 'haley', password: 'test')
      reward1 = Reward.create!(title: 'FreeTime', value: 30, description: 'Awesome!')
      reward2 = Reward.create!(title: 'PhoneTime', value: 30, description: 'Cool!')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_rewards_path

      click_on reward2.description

      expect(current_path).to eq(admin_rewards_path)
      expect(page).to_not have_content('Phone Time')
    end
  end
end
