Rails.application.routes.draw do

  get '/mechanics/:id', to: 'mechanics#show', as: 'mechanic'  
  # Defines the root path route ("/")
  # root "articles#index"
end
