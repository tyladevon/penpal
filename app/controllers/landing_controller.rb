class LandingController < ApplicationController
  def index
    @daily_feeling = current_user.daily_feelings.new
  end
end
