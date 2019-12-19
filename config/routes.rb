Rails.application.routes.draw do
  root 'welcome#index'
  get '/landing', to: 'landing#index'
  get '/survey', to: 'survey#index'
  post '/survey', to: 'survey#create'
  get '/auth/google_oauth2', as: 'google_login'
  get '/auth/google_oauth2/callback', to: 'users#create'
end
