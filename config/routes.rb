Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  get '/show' => 'products#show'
end
