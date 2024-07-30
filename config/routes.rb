Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/mechanics/:id", to: "mechanics#show"
  patch "mechanics/:id/add_ride", to: "mechanics#add_ride"
  
  get "/amusement_parks/:id", to: "amusement_parks#show"

end
