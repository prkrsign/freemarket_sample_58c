Rails.application.routes.draw do
  get 'goods/new'
  get 'goods/search'
  resources :tests
  resources :goods do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  devise_for :users
  root to: 'tests#index'
  get '/show', to: 'tests#show'
  get 'products/show', to: 'products#show'
  get 'purchase/show', to: 'purchase#show'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
end
