Rails.application.routes.draw do
  resources :mechanics, only: [:show]
  resources :amusement_parks, only: [:show]
  resources :ride_mechanics, only: [:create]
end
