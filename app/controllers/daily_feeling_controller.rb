class DailyFeelingController < ApplicationController
  def create
    daily_feeling = DailyFeeling.create(feeling_param)
    if daily_feeling.save
      redirect_to '/booster'
    else
      redirct_to '/landing'
    end 
  end

  private

  def feeling_param
    params.require(:daily_feeling).permit(:feeling)
  end
end
