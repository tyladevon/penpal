class ApplicationController < ActionController::Base
  helper_method :current_user, :resource_facade

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def resource_facade
    @resource_facade ||= ResourceFacade.new(current_user)
  end
end
