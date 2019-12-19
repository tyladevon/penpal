class UsersController < ApplicationController
  def create
    user = User.find_by(email: email)
    if user
      session[:user_id] = user.id
      redirect_to landing_path
      flash[:success] = 'Login Successful'
    else
      user = User.new(
        first_name: first_name,
        last_name: last_name,
        email: email,
        google_token: token
      )
      if user.save
        flash[:success] = 'Login Successful'
        redirect_to landing_path
      else
        flash[:error] = 'Failed to Login'
        redirect_to '/'
      end
    end
  end

  private

  def first_name
    request.env['omniauth.auth']['info']['first_name']
  end

  def last_name
    request.env['omniauth.auth']['info']['last_name']
  end

  def email
    request.env['omniauth.auth']['info']['email']
  end

  def token
    request.env['omniauth.auth']['credentials']['token']
  end
end
