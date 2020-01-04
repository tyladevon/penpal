class DbtController < ApplicationController

  def show
    @entry = current_user.journal_entries.new
    redirect_to '/landing'
  end
end
