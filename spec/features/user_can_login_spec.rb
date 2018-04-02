require 'rails_helper'

describe 'User' do
  it 'can log in' do
    visit root_path

    click_on 'Log In'

    expect(current_path).to eq(login_path)

    fill_in 'Username', with: 'hmesander'
    fill_in 'Password', with: 'test'

    click_on 'Log In'

    expect(page).to have_content('Welcome, hmesander!')
  end
end
