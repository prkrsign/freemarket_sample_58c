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
  get 'tests/user_login', to: 'tests#user_login'
  get 'tests/exhibit', to: 'tests#exhibit'
  get 'tests/logout', to: 'tests#logout'
  get 'tests/product_details', to: 'tests#product_details'
  get 'tests/credit_enter', to: 'tests#credit_enter'
  get 'tests/credit_register', to: 'tests#credit_register'
  get 'tests/make_sure_user_info', to: 'tests#make_sure_user_info'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
end
