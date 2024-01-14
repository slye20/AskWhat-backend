Rails.application.routes.draw do
  resources :forum_threads
  resources :comments
  resources :categories

  post '/login',    to: 'auth#create'
  get '/me',   to: 'users#show'
  post '/signup', to: 'users#create'
  get '/search', to: 'search#show'


  resources :users, only: [:create, :show, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
