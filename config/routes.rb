Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  # restaurants
  get '/restaurants', to: 'restaurants#index'
  post '/restaurants', to: 'restaurants#create'
  get '/restaurants/:id', to: "restaurants#show"
  get '/restaurants/:id/edit', to: 'restaurants#edit'
  patch '/restaurants/:id', to: 'restaurants#update'

  # pastas


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
  get '/drinks/:id/edit', to: 'drinks#edit'
  patch '/drinks/:id', to: 'drinks#update'

  # drinks by shop
  get '/boba_shops/:id/drinks', to: 'drinks_by_shop#index'
  get '/boba_shops/:id/drinks/new', to: 'drinks_by_shop#new'
  post '/boba_shops/:id/drinks', to: 'drinks_by_shop#create'
end
