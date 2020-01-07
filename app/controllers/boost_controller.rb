class BoostController < ApplicationController
  before_action :logged_in?, :survey_not_completed?

  def show
    if params["completed"]
      @completed = true
    else
      if params['journal']
        @journal_complete = true
      end
      facade = ResourceFacade.new(current_user)
      facade.get_resource
      session[:suggestion] = facade.suggestion
      render locals: { resource_facade: facade }
    end
  end
end
