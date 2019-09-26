Rails.application.routes.draw do
  
  get 'goods/new'
  get 'goods/search'
  resources :tests


  
  resources :cards do
    collection do
      get 'step5' => 'cards#step5'
    end
  end
  resources :addresses 
  
  resources :signup do
    collection do
      get 'step1' => 'signup#step1'
      get 'step2' => 'signup#step2'
    end
  end
  

  resources :purchase do  # 商品購入確認ページにて使用YS

    collection do
      post 'pay/:id' => 'purchase#pay', as: 'pay'
    end
  end
# 注意！グッズコントローラの中に使うメソッド内に別のコントローラーを入れないように注意！カテゴリーが表示されなかったのにはresources :purchaseを入れたことが原因だった9/24 YS
  resources :goods do 
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_delivery_children', defaults: { format: 'json' }
    end
  end

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                 registrations: 'users/registrations' ,
                 sessions: 'users/sessions'
                }

  root to: 'goods#index'
  

  #商品詳細ページ
  get  'products/new',  to: 'products#new'    #商品登録ページ（テスト）
  post  'products/new',  to: 'products#new'   
  post 'products',      to: 'products#create' #商品登録機能（テスト）
  get  'products/show', to: 'products#show'   #商品詳細ページ
  post 'products/index', to: 'products#index'

  get 'products/show', to: 'products#show'


   #商品購入ページテスト用以下消してもOKなはず　9/23 YS
  # get 'purchase/show', to: 'purchase#show'

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


  # devise_for :users, :controllers => {
  #   :registrations => 'users/registrations',
  #   :sessions => 'users/sessions',
  # } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new" 
  end
  
end
