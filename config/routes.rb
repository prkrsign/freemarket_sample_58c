Rails.application.routes.draw do
  resources :tests
  devise_for :users
  root to: 'tests#index'
  get '/show', to: 'tests#show'

  get  'products/new',  to: 'products#new'    #商品登録ページ（テスト）
  post  'products/new',  to: 'products#new'
  post 'products',      to: 'products#create' #商品登録機能（テスト）
  get  'products/show', to: 'products#show'   #商品詳細ページ
  post 'products/index', to: 'products#index'
  
  get 'purchase/show', to: 'purchase#show' #商品購入ページ
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
end
