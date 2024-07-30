Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :mechanics, only: [:show] 
  resources :mechanic_rides, only: [:create, :new], controller: :mechanic_rides
  resources :amusement_parks, only: [:show]

end
