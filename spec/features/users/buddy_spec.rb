require 'rails_helper'

describe 'As a registered user' do
  it 'it can add a support buddy' do
    user = create(:user)
    stub_user(user)

    visit profile_path

    click_link 'Buddies'

    expect(current_path).to eq('/buddies')

    click_button 'Add a Buddy'

    expect(current_path).to eq('/buddies/new')

    fill_in :first_name, with: 'Greg'
    fill_in :last_name, with: 'Mitchell'
    fill_in :email, with: 'george_michael@mail.com'
    fill_in :phone_number, with: '303-555-2424'

    click_button 'Add Buddy'

    expect(current_path).to eq('/buddies')
    expect(page).to have_content('Greg Mitchell')
    expect(page).to have_content('george_michael@mail.com')
    expect(page).to have_content('303-555-2424')
    expect(page).to have_content('Successfully added buddy!')
  end
end
