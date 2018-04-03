require 'rails_helper'

describe 'Admin' do
  describe 'visits rewards index' do
    it 'they see rewards and buttons to create, update and delete rewards' do
      admin = User.create!(username: 'hmesander', password: 'test', role: 1)
      reward = Reward.create(title: 'PhoneTime', value: 30, description: 'Awesome!', image: 'public/phone.jpeg')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_rewards_path

      expect(page).to have_content('PhoneTime')
      expect(page).to have_content('Add a Reward')
      expect(page).to have_content('Update Reward')
      expect(page).to have_content('Delete Reward')
    end
  end
end
