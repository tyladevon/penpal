class DailyFeelingController < ApplicationController
  def create
    binding.pry
    daily_feeling = DailyFeeling.create(feeling_param)
    if daily_feeling.save
      redirect_to '/boost'
    else
      redirect_to '/landing'
    end
  end

  private

  def feeling_param
    params.permit('feeling: feeling')
  end
end
