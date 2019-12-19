require 'rails_helper'

describe 'As a registered user' do
  it 'it can log out' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit landing_path

    within '.nav' do
      click_button 'Logout'
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Logout Successful')
    expect(page).to_not have_button('Logout')
  end
end
