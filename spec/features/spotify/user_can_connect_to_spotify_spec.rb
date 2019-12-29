require 'rails_helper'


describe 'user can connect to spotify' do
  it 'by clicking to connect from profile page' do
    user = create(:user)
    stub_user(user)

    visit '/profile'

    click_link 'Connect to Spotify'



  end
end
