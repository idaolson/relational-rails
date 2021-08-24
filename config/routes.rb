Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/restaurants', to: 'restaurants#index'
  get '/boba_shops', to: 'boba_shops#index'
  get '/restaurants/new', to: 'restaurants#new'
  post '/restaurants', to: 'restaurants#create'
end
