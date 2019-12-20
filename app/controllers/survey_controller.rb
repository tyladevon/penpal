class SurveyController < ApplicationController
  def index
    @survey = Survey.new
  end

  def create
    params['feelings'].each do |k,v|
      current_user.feelings.create(feeling: v)
    end 
  end
end
