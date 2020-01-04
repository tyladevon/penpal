class DbtController < ApplicationController

  def show
    @entry = current_user.journals.new
  end
end
