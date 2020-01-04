class DbtController < ApplicationController

  def show
    @entry = current_user.journals.new

    redirect_to '/landing'
  end
end
