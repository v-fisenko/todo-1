Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :managers
  resources :projects

  root  'sessions#new'
  match '/signup',  to: 'managers#new',         via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'



end
