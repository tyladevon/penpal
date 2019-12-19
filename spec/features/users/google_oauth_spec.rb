require 'rails_helper'

describe 'As a registered user' do
  it 'I can login with Google OAuth from the login page' do
    stub_omniauth
    visit '/'
    expect(page).to have_link('Sign in with Google')
    click_link('Sign in with Google')

    expect(current_path).to eq('/landing')
    expect(page).to have_content("Welcome #{user.first_name}!")
  end
end
