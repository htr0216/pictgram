Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'
  
  
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  
  resources :topics
 # resources :comment

 
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create' 
  delete '/favorites', to: 'favorites#destroy'
  
  
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
end
