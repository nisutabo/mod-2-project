Rails.application.routes.draw do
  resources :reviews
  resources :leases
  resources :buildings
  resources :property_managers do
    resources :reviews, only: [:index]
  end
  resources :users


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  root 'application#home'
  get '/about', to: 'application#about', as: :about
  get '/statistics', to:'application#statistics',as: :statistics

  delete '/reviews/:id', to: 'reviews#destroy', as: :delete_review

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
