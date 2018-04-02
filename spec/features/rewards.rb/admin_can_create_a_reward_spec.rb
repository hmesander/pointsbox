require 'rails_helper'

describe 'User visits rewards index page' do
  context 'as admin' do
    it 'allows admin to see a button to create a new reward' do
      admin = User.create!(username: 'hmesander', password: 'test', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_rewards_path
      expect(page).to have_content('Add a Reward')
    end
  end
end
