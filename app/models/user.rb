class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,  omniauth_providers: %i[facebook google_oauth2]
  has_many :sns_credentials, dependent: :destroy


  
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    
    # binding.pry
    
    

    #sns登録のみ完了してるユーザー
    if snscredential.present? 
      user = User.where(id: snscredential.user_id).first
      unless user.present? #ユーザーが存在しないなら
        user = User.new(
          username: auth.info.name,
          email: auth.info.email
        )
      end
      sns = snscredential
    
    # binding.pry
    

    #sns登録 なし
    else 
      user = User.where(email: auth.info.email).first

      #会員登録 済み
      if user.present? 
        sns = SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      # binding.pry

      #会員登録 なし
      else 
        user = User.new(
          email: auth.info.email,
          username: auth.info.name
        )

        sns = SnsCredential.create(
          uid: uid,
          provider: provider,
        )
        # binding.pry

      end
    end

    # hashでsnsのidを返り値として保持しておく
    return {  user: user , sns_id: sns.id }
    # binding.pry
  end
end
