class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGIX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :username,                 presence: true, length: { minimum:2, maximum:10 }
  validates :email,                    presence: true
  validates :email,                    uniqueness: true
  validates :email,                    format: { with: VALID_EMAIL_REGIX }
  validates :password,                 presence: true
  validates :password,                 length: { minimum: 7, maximum: 20}
  validates :password,                 confirmation: true
  # validates :password_confirmation,    presence: true
  # validates :phone_number,             presence: true
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
  validates :birth_day,                presence: true
end