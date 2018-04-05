require 'rails_helper'

describe 'User' do
  it 'can log out' do
    user = User.create!(username: 'hmesander', password: 'test')

    visit root_path

    click_on 'Log In'

    fill_in 'Username', with: 'hmesander'
    fill_in 'Password', with: 'test'

    within('.button') do
      click_on 'Log In'
    end

    expect(current_path).to eq(user_path(user))

    click_on 'Log Out'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Log In')
  end
end
