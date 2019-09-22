Rails.application.routes.draw do
  get 'goods/new'
  get 'goods/search'
  resources :goods do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                 registrations: 'users/registrations' }

  root to: 'goods#index'
  

  get  'products/new',  to: 'products#new'    #商品登録ページ（テスト）
  post  'products/new',  to: 'products#new'   
  post 'products',      to: 'products#create' #商品登録機能（テスト）
  get  'products/show', to: 'products#show'   #商品詳細ページ
  post 'products/index', to: 'products#index'
  
  get 'purchase/show', to: 'purchase#show' #商品購入ページ
  get 'products/show', to: 'products#show'
  get 'purchase/show', to: 'purchase#show'

  # スプリントレビュー用
  # root to: 'tests#index'
  # get '/show', to: 'tests#show'
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
  get 'tests/edit_profile', to: 'tests#edit_profile'
  get 'tests/purchase_confirmation', to: 'tests#purchase_confirmation'
  get 'tests/put_up_goods_on_sale', to: 'tests#put_up_goods_on_sale'
  get 'tests/purchased_on_deal', to: 'tests#purchased_on_deal'


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
end
