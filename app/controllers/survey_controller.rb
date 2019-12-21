class SurveyController < ApplicationController
  def index
    @survey = Survey.new
  end

  def create
    params['feelings'].each do |feeling|
      current_user.feelings.create(feeling: feeling)
    end

    flash[:success] = 'Preferences saved'
    redirect_to '/landing'
  end
end
