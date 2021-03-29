Rails.application.routes.draw do
  get '/restaurants', to: 'restaurants#index'
end
