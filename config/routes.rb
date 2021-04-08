Rails.application.routes.draw do
  resources :restaurants

  # get '/restaurants', to: 'restaurants#index'
  # post '/restaurants', to: 'restaurants#create'
  # get '/new_restaurant', to: 'restaurants#new'
  # post '/restaurant_list', to: 'restaurants#list'
end
