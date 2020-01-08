require 'rails_helper'

describe 'As a registered user' do
  it 'it can log out' do
    user = create(:user, survey?: true)
    stub_user(user)
    ResourcePreference.create(user_id: user.id, journal: true )


    visit landing_path

    within '.nav' do
      click_button 'Logout'
    end

    expect(page).to have_content('Logout Successful')
  end
end
