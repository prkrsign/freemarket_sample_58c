Rails.application.routes.draw do
  
  resources :cards do
    collection do
      get 'complete', to: 'cards#complete'
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
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
    get 'new'
    member do 
      get 'show_delete'
      get 'good_delete_popup'
      get 'edit'
    end

    collection do    
      get 'search'
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
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new" 
    get '/users/sign_out' => 'users/sessions#destroy'
  end

  root to: 'goods#index'
  
  # マイページ用ルーティング
  get 'mypage', to: 'mypage#mypage', as: 'mypage'
  get 'mypage/put_up_goods_on_sale', to: 'mypage#put_up_goods_on_sale'
  get 'mypage/purchased_on_deal', to: 'mypage#purchased_on_deal'
  get 'mypage/edit_profile', to: 'mypage#edit_profile'
  get 'mypage/credit_enter', to: 'mypage#credit_enter'
  get 'mypage/make_sure_user_info', to: 'mypage#make_sure_user_info'
  get 'mypage/credit_register', to: 'mypage#credit_register'
  get 'mypage/logout', to: 'mypage#logout'
  
end
