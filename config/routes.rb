Rails.application.routes.draw do
  # get 'pages/index'
  root 'pages#index'
  get 'pages/help'
  get 'users/new'
  post '/users', to:'users#create'
 
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
