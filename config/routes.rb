Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/restaurants', to: 'restaurants#index'
  get '/boba_shops', to: 'boba_shops#index'
  get '/restaurants/new', to: 'restaurants#new'
  get '/boba_shops/new', to: 'boba_shops#new'
  get '/boba_shops/:id', to: 'boba_shops#show'
  post '/restaurants', to: 'restaurants#create'
  post '/boba_shops', to: 'boba_shops#create'
end
