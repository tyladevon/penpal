class BuddiesController < ApplicationController
  def index; end

  def new; end

  def create
    buddy = current_user.buddies.new(buddy_params)
    if buddy.save
      flash[:success] = 'Successfully added buddy!'
      redirect_to '/buddies'
    else
      flash[:error] = buddy.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def buddy_params
    params.permit(:first_name, :last_name, :email, :phone_number)
  end
end
