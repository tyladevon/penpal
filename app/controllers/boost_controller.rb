class BoostController < ApplicationController

  def show
    @entry = current_user.journal_entries.new
    if params["completed"]
      @completed = true
    end 
  end

end
