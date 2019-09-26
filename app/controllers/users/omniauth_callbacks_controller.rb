# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # SNSログイン機能。app/models/user.rbで定義したメソッドを利用して、user情報、sns_idの使い道を条件分岐する。(神山)
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google_oauth2)
  end


  # infoで必要な情報を抜き出して、userが存在する場合とuserが存在しない場合で処理を分ける
  def callback_for(provider)
    @omniauth =request.env["omniauth.auth"]  
    info = User.find_oauth(request.env["omniauth.auth"])
    @user = info[:user]
    sns_id = info[:sns_id]

    # userが存在する場合。sign_inした上でrootにリダレクトされる？ 
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?

    
    # userが存在しない場合。snsから引き抜いた情報を持って、user登録画面に遷移する
    # user_idとsns_idでリレーションを組む必要があるため、sns_idを次のメソッドに持ち越す。
    # ユーザー情報はビューに表示する必要があるため、インスタンス変数@userを使う。
    else 
      #sns_credentialのidを他のメソッドに持ち越す
      session["devise.sns_id"] = sns_id 
      #redirect_to だと更新してしまうのでrenderで。
      render template: "tests/signup1" 
      
    end
  end

  def failure
    redirect_to root_path and return
  end

  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
