Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#Users
  resources :users, only: [:index, :show, :edit, :update, :new, :create, :destroy]
  get '/signup' => 'users#new'
  get 'users/private_page' => 'users#private_page', as: 'private_page'
#Sessions
  resources :sessions, only: [:new, :create, :destroy]
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  post '/login' => 'sessions#new'
#Static
  get '/' => 'static#home'
  get '/analytics' => 'static#analytics'
  get '/analytics/houses' => 'static#analytics_houses'
  get '/analytics/garages' => 'static#analytics_garages'
  get '/analytics/bedrooms' => 'static#analytics_bedrooms'
  get '/analytics/kitchens' => 'static#analytics_kitchens'
  get '/analytics/other_rooms' => 'static#analytics_other_rooms'
  get '/analytics/bathrooms' => 'static#analytics_bathrooms'

#RESTful controllers
  resources :houses
  resources :bathrooms
  resources :bedrooms
  resources :garages
  resources :other_rooms
  resources :kitchens
  resources :room_styles
end
