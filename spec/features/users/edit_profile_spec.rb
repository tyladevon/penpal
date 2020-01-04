require 'rails_helper'


describe 'user can edit their profile' do
  it 'from profile edit link' do
    user = create(:user)
    stub_user(user)

    visit '/profile'

    click_on 'Edit Profile'

    fill_in 'First name', with: 'Lucille'
    fill_in 'Last name', with: 'Ball'
    fill_in 'Email', with: 'lucyball@gmail.com'
    click_on 'Update User'

    user.reload
    expect(current_path).to eq('/profile')
    expect(page).to have_content('Profile Updated!')
    expect(user.first_name).to eq('Lucille')
    expect(user.last_name).to eq('Ball')
    expect(user.email).to eq('lucyball@gmail.com')
  end

  it 'cannot edit without adding all info' do
    user = create(:user)
    stub_user(user)

    visit '/profile'

    click_on 'Edit Profile'

    fill_in 'First name', with: 'Lucille'
    fill_in 'Last name', with: ''
    fill_in 'Email', with: ''
    click_on 'Update User'

    expect(page).to have_content("Last name can't be blank and Email can't be blank")
  end
end
