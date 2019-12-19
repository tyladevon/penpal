require 'rails_helper'

describe 'As a registered user' do
  it 'I can login with Google OAuth from the login page' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '123545',
      credentials: { 'token' => 'GOOGLE_TOKEN', 'expires'=>true },
      info: { email: 'hfinn@mail.com',
              first_name: 'Huck',
              last_name: 'Finn',
            }})
    User.last

    expect(current_path).to eq('/landing')
    expect(page).to have_content("Welcome #{user.first_name}!")
  end
end
