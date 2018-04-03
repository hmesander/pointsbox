require 'rails_helper'

describe 'User' do
  describe 'visits rewards index' do
    it 'they see rewards and button to select a reward' do
      user = User.create!(username: 'hmesander', password: 'test', role: 0)
      reward = Reward.create!(title: 'PhoneTime', value: 30, description: 'Awesome!', image: 'public/phone.jpeg')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit rewards_path

      expect(page).to have_content(reward.title)
      expect(page).to have_content(reward.description)
      expect(page).to have_content('Redeem Reward')
      expect(page).to_not have_content('Add a Reward')
      expect(page).to_not have_content('Update Reward')
      expect(page).to_not have_content('Delete Reward')
    end
  end
end
