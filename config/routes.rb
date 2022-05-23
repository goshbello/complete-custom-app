Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #root route
  root to: 'pages#index'
  #Other pages routes
  get '/about', to: 'pages#about'
  get '/help', to: 'pages#help'
  get '/contact', to: 'pages#contact'
  get '/news', to: 'pages#news'

  #Users routes
  get '/signup', to: 'users#new'

  # all resources for users { index, show, edit, update, delete }
  resources :users
  
end
