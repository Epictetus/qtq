Rails.application.routes.draw do
  root 'users#show'
  resources :users, only: [:show, :new, :create]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :account_activations, only: [:edit]
end
