require 'rails_helper'

describe 'Authentication' do
  scenario 'allows user to register successfully' do
    visit root_path

    click_on 'Register for PointsBox'

    expect(current_path).to eq(new_user_path)

    fill_in 'Username', with: 'hmesander'
    fill_in 'Password', with: 'test'

    click_on 'Create User'

    expect(page).to have_content('Welcome, hmesander!')
  end
end
