Rails.application.routes.draw do
  resources :tests
  devise_for :users
  root to: 'tests#index'
  get '/show', to: 'tests#show'
  get 'products/show', to: 'products#show'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
end
