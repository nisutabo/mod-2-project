Rails.application.routes.draw do
  resources :reviews
  resources :leases
  resources :buildings
  resources :property_managers
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
