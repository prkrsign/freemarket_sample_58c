class Address < ApplicationRecord
  belongs_to :prefecture, optional: true
  belongs_to :user, optional: true
  has_many :goods
  has_many :deals
             
  validates :family_name,                 presence: true, length: { minimum:1, maximum:10 }
  validates :first_name,                  presence: true, length: { minimum:1, maximum:10 }
  validates :family_name_kana,            presence: true, format: { 
                                          with: /\A[\p{katakana}ー－]+\z/, 
                                          message: "はカナ文字を入力してください" }
  validates :first_name_kana,             presence: true, format: { 
                                          with: /\A[\p{katakana}ー－]+\z/, 
                                          message: "はカナ文字を入力してください" }
  validates :postalcode,                  presence: true
  validates :city,                        presence: true
  validates :house_number,                presence: true
  validates :user_id,                     presence: true
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end