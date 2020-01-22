Rails.application.routes.draw do

  get 'favorites/index'
  post '/favorites', to:"favorites#create"
  delete '/favorites', to:'favorites#destroy'
  
  root 'pages#index'
  get 'pages/help'
  get 'users/new'
  post '/users', to:'users#create'
 
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  
  resources :topics
  
  get 'comments/new'
  post '/comments', to: 'comments#create'
  
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
