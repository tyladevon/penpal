require 'rails_helper'

describe 'SpotifyService can make api call' do
  it 'can get a user token and refresh token', :vcr do
    user = create(:user, survey?: true, spotify_refresh_token: 'akgngnkr')

  end
end
