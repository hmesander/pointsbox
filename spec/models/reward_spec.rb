require 'rails_helper'

describe Reward, type: :model do
  describe 'validates' do
    it 'presence of title' do
      reward = Reward.new

      expect(reward).to_not be_valid
    end
  end
end
