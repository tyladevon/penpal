class SurveyController < ApplicationController
  def index
    @survey = Survey.new
  end

  def create
    binding.pry
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
    params.require('music').permit('rock', 'folk/indie', 'custom', 'custom2', 'r&b-soul')
  end

  def feeling_params
    params.require('feelings').permit('sad', 'down', 'unmotivated', 'alone', 'mad')
  end

  def activity_params
    params.require('resources').permit! && params.require('activity').permit!
  end

  def time_params
    params.require('time').permit('before-bed', 'mid-day', 'before-bed', 'random' )
  end

  def media_params
    params.require('media').permit('dogs', 'cats', 'animals', 'babies', 'celestial', 'landscapes')
  end
end
