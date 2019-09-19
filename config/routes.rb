Rails.application.routes.draw do
  get 'goods/new'
  get 'goods/search'
  resources :goods
  devise_for :users
  root to: 'tests#index'
  get 'products/show', to: 'products#show'
  get 'purchase/show', to: 'purchase#show'

  # スプリントレビュー用
  get 'tests/signup', to: 'tests#signup'
  get 'tests/signup1', to: 'tests#signup1'
  get 'tests/signup2', to: 'tests#signup2'
  get 'tests/signup3', to: 'tests#signup3'
  get 'tests/signup4', to: 'tests#signup4'
  get 'tests/signup5', to: 'tests#signup5'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
end
