Rails.application.routes.draw do
  
  get 'goods/new'
  get 'goods/search'
  resources :tests
  resources :goods
  resources :cards 
  resources :addresses 
  
  resources :signup do
    collection do
      get 'step1' => 'signup#step1'
      get 'step2' => 'signup#step2'
    end
  end
  root to: 'tests#index'
  get '/show', to: 'tests#show'
  get 'products/show', to: 'products#show'
  get 'purchase/show', to: 'purchase#show'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
  #   get "sign_out", :to => "users/sessions#destroy" 
  end
  
end
