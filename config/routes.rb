Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :mechanics, only: [:show] 

  # resources :mechanics, only: [:show] do
  #   resources :rides, only: [:edit, :update], controller: :mechanic_rides
  # end

  resources :mechanic_rides, only: [:create, :new], controller: :mechanic_rides

end
