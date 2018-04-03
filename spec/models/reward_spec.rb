require 'rails_helper'

describe Reward, type: :model do
  describe 'validates' do
    it 'presence of title' do
      reward = Reward.new(value: 40, description: 'Awesome reward!', image: 'public/phone.jpeg')

      expect(reward).to_not be_valid
    end
    it 'presence of value' do
      reward = Reward.new(title: 'PhoneTime', description: 'Awesome reward!', image: 'public/phone.jpeg')

      expect(reward).to_not be_valid
    end
    it 'presence of description' do
      reward = Reward.new(title: 'PhoneTime', value: 40, image: 'public/phone.jpeg')

      expect(reward).to_not be_valid
    end
    it 'presence of image' do
      reward = Reward.new(title: 'PhoneTime', value: 40, description: 'Awesome reward!')

      expect(reward).to_not be_valid
    end
  end
end
