Rails.application.routes.draw do
  root to: 'projects#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'  

  resources :projects

  resources :tickets do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  resources :users, only: [:new, :create]
end
