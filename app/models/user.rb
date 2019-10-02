class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        #  :recoverable, :rememberable, :validatable,
         :recoverable, :rememberable, :validatable, :omniauthable,  omniauth_providers: %i[facebook google_oauth2]

  has_one :address
  has_many :sns_credentials, dependent: :destroy
  has_many :goods
  has_one :cards

  VALID_EMAIL_REGIX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  
  validates :username,                 presence: true, length: { minimum:1, maximum:10 }
  validates :email,                    presence: true
  validates :email,                    uniqueness: true
  validates :email,                    format: { with: VALID_EMAIL_REGIX }
  validates :password,                 presence: true
  validates :password,                 length: { minimum: 7, maximum: 20}
  validates :password,                 confirmation: true
  validates :phone_number,             presence: true, format: { with: VALID_PHONE_REGEX }
  validates :phone_number,             numericality: true
  validates :family_name,              presence: true
  validates :first_name,               presence: true
  validates :family_name_in_katakana,  presence: true, format: { 
                                       with: /\A[\p{katakana}ー－]+\z/, 
                                       message: "はカナ文字を入力してください" }
  validates :first_name_in_katakana,       presence: true, format: { 
                                       with: /\A[\p{katakana}ー－]+\z/, 
                                       message: "はカナ文字を入力してください" }
  validates :birth_year,               presence: true
  validates :birth_month,              presence: true
  validates :birth_date,                presence: true

  #        :recoverable, :rememberable, :validatable, :omniauthable,  omniauth_providers: %i[facebook google_oauth2]
  # has_many :sns_credentials, dependent: :destroy


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
          provider: provider
        )

      end
    end

    # hashでuser情報と、snsのidを返り値として保持しておく
    return {  user: user , sns_id: sns.id }
  end
end
