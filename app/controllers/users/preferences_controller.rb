class Users::PreferencesController < ApplicationController

  def index
    @user = current_user
  end

  def edit
  end

  def update

    update_feelings

    update_music_preferences

    update_activity_preferences

    update_time_preferences

    update_media_preferences

    flash[:success] = 'Preferences updated'
    redirect_to '/preferences'
  end

  private

  def update_feelings
    current_user.feeling_preferences.destroy
    feeling_params.values.each do |feel|
      current_user.feeling_preferences.create(feeling: feel)
    end
  end

  def update_music_preferences
    current_user.music_preferences.destroy
    music_params.values.each do |gen|
      if gen != ''
        current_user.music_preferences.create(genre: gen)
      end
    end
  end

  def update_activity_preferences
    current_user.activity_preferences.destroy
    activity_params.values.each do |activity|
      if activity != ''
        current_user.activity_preferences.create(description: activity)
      end
    end
    resource_params.values.each do |resource|
      current_user.activity_preferences.create(description: resource)
    end
  end

  def update_time_preferences
    current_user.time_preference.destroy
    time = TimePreference.create(user_id: current_user.id)
    time_params.values.each do |pref|
      time.update_attribute(pref, true)
    end
  end

  def update_media_preferences
    current_user.media_preference.destroy
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
