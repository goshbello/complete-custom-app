Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #root route
  root to: 'pages#index'
  #Other pages routes
  get '/about', to: 'pages#about'
  get '/help', to: 'pages#help'
  get '/contact', to: 'pages#contact'
  get '/news', to: 'pages#news'

  # GET user signup form
  get '/signup', to: 'users#new'

  # GET login for 
  get '/login', to: 'sessions#new'
  # POST send completed for to create to sign user in, if information are all correct
  post '/login', to: 'sessions#create'
  # DESTROY logout user, destroy/delete the saved user_id
  delete '/logout', to: 'sessions#destroy'


  # all resources for users { index, show, edit, update, delete }
  resources :users
  
end
