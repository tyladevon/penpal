class BoostController < ApplicationController

  def show
    if params["completed"]
      @completed = true
    end
  end

end
