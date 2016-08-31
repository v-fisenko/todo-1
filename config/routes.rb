Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]

#  resources :lamers

  root  'sessions#new'
#  match '/signup',  to: 'lamers#new',           via: 'get'
  match '/signup',  to: 'sessions#new',           via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
#  match '/help',    to: 'static_pages#help',    via: 'get'
#  match '/about',   to: 'static_pages#about',   via: 'get'
#  match '/contact', to: 'static_pages#contact', via: 'get'



end
