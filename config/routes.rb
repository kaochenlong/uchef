Rails.application.routes.draw do
  resources :users, only: [:create] do
    collection do
      get :sign_up, action: 'new'
    end
  end

  resources :sessions, path: 'users', only: [:destroy] do
    collection do
      get :sign_in, action: 'new'
      post :sign_in, action: 'create'
    end
  end

  resources :restaurants
  root "restaurants#index"

  # get '/restaurants', to: 'restaurants#index'
  # post '/restaurants', to: 'restaurants#create'
  # get '/new_restaurant', to: 'restaurants#new'
  # post '/restaurant_list', to: 'restaurants#list'
end
