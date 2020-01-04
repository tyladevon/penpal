class SpotifyController < ApplicationController

  def create
    user = current_user
    user.update({
      spotify_token: params['code']
      })

    redirect_to '/profile'
  end
end
