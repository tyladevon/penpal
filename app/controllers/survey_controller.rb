class SurveyController < ApplicationController
  def index
    @survey = Survey.new
  end

  def create
    current_user.feelings.create(feeling_params)


    current_user.music_preferences.create(music_params)

    current_user.activity_preferences.create(activity_params)

    current_user.time_preferences.create(time_params)

    current_user.media_preferences.create(media_params)

    flash[:success] = 'Preferences saved'
    redirect_to '/landing'
  end




  private

  def music_params
  end

  def feeling_params

  end

  def activity_params
  end

  def time_params
  end

  def media_params
  end
end
