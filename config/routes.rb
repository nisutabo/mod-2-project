Rails.application.routes.draw do
  resources :reviews
  resources :leases
  resources :buildings
  resources :property_managers
  resources :users


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/', to: 'application#home'

  delete '/reviews/:id', to: 'reviews#destroy', as: :delete_review

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
