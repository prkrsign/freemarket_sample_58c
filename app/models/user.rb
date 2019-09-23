class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,  omniauth_providers: %i[facebook google_oauth2]
  has_many :sns_credentials, dependent: :destroy


  # SNSログイン機能。facebookかgoogleからユーザー情報を引っ張り出してreturnする。(神山)
  # このときSNScredentialsテーブルにはuidとproviderを保存するが、User情報は保存しない。
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    
    
    #sns登録のみ完了してるユーザー?
    if snscredential.present? 
      user = User.where(id: snscredential.user_id).first
      unless user.present? #ユーザーが存在しないなら
        user = User.new(
          username: auth.info.name,
          email: auth.info.email
        )
      end
      sns = snscredential

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

      #会員登録 なし
      else 
        # Userテーブル用の情報として、emailとusernameの値をオブジェクト化。値はSNSから引っ張りだす。まだDBには保存しない。
        user = User.new(
          email: auth.info.email,
          username: auth.info.name
        )

        # Snscredentialテーブルにuidとproviderを保存。providerはfacebookかgoogleのこと。uidはprovider側で管理しているidのこと。
        sns = SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
        )

      end
    end

    # hashでuser情報と、snsのidを返り値として保持しておく
    return {  user: user , sns_id: sns.id }
  end
end
