require 'rails_helper'

describe 'User' do
  describe 'visits rewards index and selects an award' do
    it 'they redeem points for that reward' do
      user = User.create!(username: 'hmesander', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      reward1 = Reward.create(title: 'PhoneTime', value: 3, description: 'Awesome!', image: 'public/phone.jpeg')
      reward2 = Reward.create(title: 'Candy', value: 4, description: 'Awesome!', image: 'public/phone.jpeg')
      reward3 = Reward.create(title: 'Puppy', value: 5, description: 'Awesome!', image: 'public/phone.jpeg')
      reward4 = Reward.create(title: 'Cat', value: 6, description: 'Awesome!', image: 'public/phone.jpeg')
      point1 = user.points.create!(status: 'active')
      point2 = user.points.create!(status: 'active')
      point3 = user.points.create!(status: 'active')
      point4 = user.points.create!(status: 'active')

      visit rewards_path

      click_on "Redeem #{reward1.title}"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Total Points: 1")
      expect(page).to have_content(reward1.title)
      expect(page).to have_content(reward1.description)
      expect(page).to have_content(reward1.image)
    end
  end
end
