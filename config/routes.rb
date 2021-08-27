Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  # restaurants
  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/new', to: 'restaurants#new'
  post '/restaurants', to: 'restaurants#create'
  get '/restaurants/:id', to: "restaurants#show"
  get '/restaurants/:id/edit', to: 'restaurants#edit'
  patch '/restaurants/:id', to: 'restaurants#update'

  # pastas
  get '/pastas', to: 'pastas#index'
  get '/restaurants/:id/pastas/new', to: 'pastas#new'
  post '/pastas', to: 'pastas#create'
  get '/pastas/:id', to: "pastas#show"

  # restaurant pastas
  get '/restaurants/:id/pastas', to: 'restaurant_pastas#index'

  # boba shops
  get '/boba_shops', to: 'boba_shops#index'
  get '/boba_shops/new', to: 'boba_shops#new'
  get '/boba_shops/:id', to: 'boba_shops#show'
  get '/boba_shops/:id/edit', to: 'boba_shops#edit'
  post '/boba_shops', to: 'boba_shops#create'
  patch '/boba_shops/:id', to: 'boba_shops#update'

  # drinks
  get '/drinks', to: 'drinks#index'
  get '/drinks/:id', to: 'drinks#show'
  get '/boba_shops/:id/drinks', to: 'drinks_by_shop#index'
  get '/boba_shops/:id/drinks/new', to: 'drinks_by_shop#new'
  get '/drinks/:id/edit', to: 'drinks#edit'
  post '/boba_shops/:id/drinks', to: 'drinks_by_shop#create'
  patch '/drinks/:id', to: 'drinks#update'
end
