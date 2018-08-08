Rails.application.routes.draw do
  root to: 'projects#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'  

  resources :projects
  resources :tickets do
    post :comment, on: :collection
    post :comment, on: :member
    delete :comment, on: :member
  end

  resources :users, only: [:new, :create]
end
