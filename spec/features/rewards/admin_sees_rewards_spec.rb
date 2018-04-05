require 'rails_helper'

describe 'Admin' do
  describe 'visits rewards index' do
    it 'they see rewards and buttons to create, update and delete rewards' do
      admin = User.create!(username: 'hmesander', password: 'test', role: 1)
      Reward.create!(title: 'Phone Time', value: 30, description: 'Awesome!')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_rewards_path

      expect(page).to have_content('Phone Time')
      expect(page).to have_content('Add a Reward')
      expect(page).to have_content('Update Reward')
      expect(page).to have_content('Delete Reward')
    end
  end
end
