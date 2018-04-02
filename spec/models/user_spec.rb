require 'rails_helper'

describe User, type: :model do
  describe 'validates' do
    it 'presence of username' do
      user = User.new(password: 'test')

      expect(user).to_not be_valid
    end

    it 'presence of password' do
      user = User.new(username: 'hmesander')

      expect(user).to_not be_valid
    end

    it 'uniqueness of username' do
      user1 = User.create!(username: 'hmesander', password: 'test')
      user2 = User.new(username: 'hmesander', password: 'test2')

      expect(user2).to_not be_valid
    end
  end
end
