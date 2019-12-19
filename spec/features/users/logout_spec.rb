require 'rails_helper'

describe 'As a registered user' do
  it 'it can log out' do
    user = create(:user)
    stub_user(user)

    visit landing_path

    within '.nav' do
      click_button 'Logout'
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Logout Successful')
    expect(page).to_not have_button('Logout')
  end
end
