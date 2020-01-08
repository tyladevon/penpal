require 'rails_helper'

describe 'As a registered user' do
  it 'it can log out' do
    user = create(:user, survey?: true)
    stub_user(user)

    visit landing_path

      click_button 'Logout'

    expect(page).to have_content('Logout Successful')
  end
end
