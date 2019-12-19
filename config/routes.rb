Rails.application.routes.draw do
  root 'welcome#index'

  get '/landing', to: 'landing#index'
  get '/survey', to: 'survey#index'

  get '/profile', to: 'users#show'
  delete '/users', to: 'users#destroy'

  delete '/logout', to: 'sessions#destroy'
  get '/auth/google_oauth2', as: 'google_login'
  get '/auth/google_oauth2/callback', to: 'users#create'
end
