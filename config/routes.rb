Rails.application.routes.draw do
  resources :tests
  devise_for :users
  root to: 'tests#index'
  get '/show', to: 'products#show'
end
