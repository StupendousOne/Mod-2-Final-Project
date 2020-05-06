Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#Users
  resources :users, only: [:show, :edit, :update, :new, :create]
  get '/signup' => 'users#new'
  get 'users/private_page' => 'users#private_page', as: 'private_page'
#Sessions
  resources :sessions, only: [:new, :create, :destroy]
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  post '/login' => 'sessions#new'
#Static
  get '/' => 'static#home'
#RESTful controllers
  resources :houses
  resources :bathrooms
  resources :bedrooms
  resources :garages
  resources :other_rooms
  resources :kitchens
  resources :room_styles
end
