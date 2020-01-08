class ApplicationController < ActionController::Base
  helper_method :current_user, :resource_facade, :logged_in?, :survey_not_completed?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    redirect_to root_path if !current_user
  end

  def survey_not_completed?
    redirect_to survey_path if current_user && !current_user.survey?
  end

  def buddy?
    return false if current_user.resource_preference.buddy == true && !current_user.buddies.empty?
    if current_user.resource_preference.buddy == true && current_user.buddies.empty?
      redirect_to '/buddies/new'
    end
  end

  def spotify?
    if !buddy? && current_user.resource_preference.music && current_user.spotify_token == nil
      redirect_to spotify_path
    end
  end

end
