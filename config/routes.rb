Rails.application.routes.draw do
  root 'welcome#index'
  get '/landing', to: 'landing#index'

  get '/auth/google_oauth2', as: 'google_login'
  get '/auth/google_oauth2/callback', to: 'users#create'
end
