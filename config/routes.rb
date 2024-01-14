Rails.application.routes.draw do
  post '/login', to: 'auth#create'
  get '/me', to: 'users#show'
  post '/signup', to: 'users#create'
  get '/search', to: 'search#show'
  resources :forum_threads, only: %i[create show index]
  resources :comments, only: %i[create show index destroy]
  resources :categories, only: %i[show index]
  resources :users, only: %i[create show index]
end
