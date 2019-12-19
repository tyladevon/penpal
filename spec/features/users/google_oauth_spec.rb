require 'rails_helper'

describe 'As a newly registered user' do
  it 'I can login with Google OAuth from the login page' do
    stub_omniauth
    visit '/'
    expect(page).to have_link('Sign in with Google')
    click_link('Sign in with Google')

    expect(current_path).to eq(survey_path)
    expect(page).to have_content('Login Successful')
    expect(page).to have_content('Penpal wants to get to know you a little more')
  end
end
