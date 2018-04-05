require 'rails_helper'

describe 'User' do
  describe 'visits rewards index and selects an award' do
    it 'they redeem points for that reward' do
      user = User.create!(username: 'hmesander', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      reward1 = Reward.create!(title: 'PhoneTime', value: 3, description: 'Awesome!')
      Reward.create!(title: 'Candy', value: 4, description: 'Awesome!')
      Reward.create!(title: 'Puppy', value: 5, description: 'Awesome!')
      Reward.create!(title: 'Cat', value: 6, description: 'Awesome!')

      5.times do
        user.points.create!
      end

      visit rewards_path

      click_on "Redeem #{reward1.title}"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Available Points: 12")
      expect(page).to have_content("Redeemed Points: 3")
      expect(page).to have_content(reward1.title)
      expect(page).to have_content(reward1.description)
    end
  end
end
