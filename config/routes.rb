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
  delete '/restaurants/:id', to: 'restaurants#destroy'

  # restaurant pastas
  get '/restaurants/:id/pastas', to: 'restaurant_pastas#index'
  get '/restaurants/:id/pastas/new', to: 'restaurant_pastas#new'
  post '/restaurants/:restaurant_id/pastas', to: 'restaurant_pastas#create'
  patch '/restaurants/:restaurant_id/pastas/:id', to: 'restaurant_pastas#edit'
  get '/restaurants/:restaurant_id/pastas/:id/edit', to: 'restaurant_pastas#edit'

  # pastas
  get '/pastas', to: 'pastas#index'
  get '/pastas/:id', to: 'pastas#show'
  get '/pastas/:id/edit', to: 'pastas#edit'
  patch '/pastas/:id', to: 'pastas#update'
  delete '/pastas/:id', to: "pastas#destroy"

  # boba shops
  get '/boba_shops', to: 'boba_shops#index'
  get '/boba_shops/new', to: 'boba_shops#new'
  get '/boba_shops/:shop_id', to: 'boba_shops#show'
  get '/boba_shops/:shop_id/edit', to: 'boba_shops#edit'
  post '/boba_shops', to: 'boba_shops#create'
  patch '/boba_shops/:shop_id', to: 'boba_shops#update'
  delete '/boba_shops/:shop_id', to: 'boba_shops#destroy'

  # drinks
  get '/drinks', to: 'drinks#index'
  get '/drinks/:drink_id', to: 'drinks#show'
  get '/drinks/:drink_id/edit', to: 'drinks#edit'
  patch '/drinks/:drink_id', to: 'drinks#update'
  delete '/drinks/:drink_id', to: 'drinks#destroy'

  # drinks by shop
  get '/boba_shops/:shop_id/drinks', to: 'drinks_by_shop#index'
  get '/boba_shops/:shop_id/drinks/new', to: 'drinks_by_shop#new'
  get '/boba_shops/:shop_id/drinks/:drink_id', to: 'drinks_by_shop#show'
  get '/boba_shops/:shop_id/drinks/:drink_id/edit', to: 'drinks_by_shop#edit'
  post '/boba_shops/:shop_id/drinks', to: 'drinks_by_shop#create'
  patch '/boba_shops/:shop_id/drinks/:drink_id', to: 'drinks_by_shop#update'
  delete '/boba_shops/:shop_id/drinks/:drink_id', to: 'drinks_by_shop#destroy'
end
