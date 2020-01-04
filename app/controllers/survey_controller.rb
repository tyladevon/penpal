class SurveyController < ApplicationController
  def index
    @survey = Survey.new
  end

  def create
    create_feelings

    create_music_preferences

    create_activity_preferences

    create_time_preferences

    create_media_preferences


    flash[:success] = 'Preferences saved'
    redirect_to '/landing'
  end

  private

  def create_feelings
    feeling_params.values.each do |feel|
      current_user.feeling_preferences.create(feeling: feel)
    end
  end

  def create_music_preferences
    music_params.values.each do |gen|
      if gen != ''
        current_user.music_preferences.create(genre: gen)
      end
    end
  end

  def create_activity_preferences
    activity_params.values.each do |activity|
      if activity != ''
        current_user.activity_preferences.create(description: activity)
      end
    end
    resource_params.values.each do |resource|
      current_user.activity_preferences.create(description: resource)
    end
  end

  def create_time_preferences
    time = TimePreference.create(user_id: current_user.id)
    time_params.values.each do |pref|
      time.update_attribute(pref, true)
    end
  end

  def create_media_preferences
    media_preference = MediaPreference.create(user_id: current_user.id)
    media_params.values.each do |media|
      media_preference.update_attribute(media, true)
    end
  end

  def music_params
    params.require('music').permit!
  end

  def feeling_params
    params.require('feelings').permit!
  end

  def activity_params
    params.require('activity').permit!
  end

  def resource_params
    params.require('resources').permit!
  end

  def time_params
    params.require('time').permit!
  end

  def media_params
    params.require('media').permit!
  end
end
