class UsersController < ApplicationController
  def create
    user = User.find_by(email: email)
    user ? found_user_redirect(user) : setup_new_user
  end

  private

    def found_user_redirect(user)
      session[:user_id] = user.id
      redirect_to landing_path
      flash[:success] = 'Login Successful'
    end

    def setup_new_user
      user = make_user
      user.save ? new_user_redirect(user) : failed_user_redirect
    end

    def make_user
      User.new(
        first_name: first_name,
        last_name: last_name,
        email: email,
        google_token: token
      )
    end

    def new_user_redirect(user)
      session[:user_id] = user.id
      flash[:success] = 'Login Successful'
      redirect_to survey_path
    end

    def failed_user_redirect
      flash[:error] = 'Failed to Login'
      redirect_to '/'
    end

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
