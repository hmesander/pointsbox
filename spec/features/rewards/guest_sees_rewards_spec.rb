require 'rails_helper'

describe 'Guest' do
  describe 'visits rewards index' do
    it 'they see a list of rewards' do
      reward = Reward.create!(title: 'PhoneTime', value: 30, description: 'Awesome!', image: 'public/phone.jpeg')

      visit rewards_path

      expect(page).to have_content(reward.title)
      expect(page).to have_content(reward.description)
      expect(page).to_not have_content('Add a Reward')
      expect(page).to_not have_content('Update Reward')
      expect(page).to_not have_content('Delete Reward')
    end
  end
end
