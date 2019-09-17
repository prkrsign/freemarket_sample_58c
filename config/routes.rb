Rails.application.routes.draw do
  get 'goods/new'
  resources :tests
  resources :goods
  devise_for :users
  root to: 'tests#index'
  get '/show', to: 'tests#show'
  get 'products/show', to: 'products#show'
  get 'purchase/show', to: 'purchase#show'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
end
