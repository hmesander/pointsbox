require 'rails_helper'

describe 'User' do
  it 'can log in' do
    user = User.create!(username: 'hmesander', password: 'test')

    visit root_path

    click_on 'Log In'

    expect(current_path).to eq(login_path)

    fill_in 'Username', with: 'hmesander'
    fill_in 'Password', with: 'test'

    within('.button') do
      click_on 'Log In'
    end

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}!")
  end
end
