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
      User.create!(username: 'hmesander', password: 'test')
      user2 = User.new(username: 'hmesander', password: 'test2')

      expect(user2).to_not be_valid
    end
  end

  describe 'roles' do
    it 'can be created as an admin' do
      user = User.create!(username: 'hmesander', password: 'test', role: 1)

      expect(user.role).to eq('admin')
      expect(user.admin?).to be_truthy
    end

    it 'can be created as a default user' do
      user = User.create!(username: 'hmesander', password: 'test', role: 0)

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end
  end
end
