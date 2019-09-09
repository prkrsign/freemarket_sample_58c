Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  get '/show', to: 'products#show'
end
