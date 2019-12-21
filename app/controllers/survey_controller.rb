class SurveyController < ApplicationController
  def index
    @survey = Survey.new
  end

  def create
    current_user.feelings.create(params['feeling'])

    params['time'].each do |time|
      current_user.time_preference.create("#{time}": true)
    end

    params['music'].each do |music|
      if music && current_user.music_prefence[music]
        current_user.music_preference.udpate("#{music}": true)
      elsif music && !current_user.music_preference['custom']
        current_user.music_prefence.update(custom: music)
      elsif music && current_user.music_preference['custom']
        current_user.music_prefence.update(custom2: music)
      end
    end

    params['resources'].each do |resource|
      current_user.activity_preferences.create(description: resource)
    end

    params['media'].each do |media|
      current_user.media_preference.update('media': true)
    end

    params['activity'].each do |activity|
      if activity
        current_user.activity_preferences.create(description: activity)
      end
    end

    flash[:success] = 'Preferences saved'
    redirect_to '/landing'
  end
end
