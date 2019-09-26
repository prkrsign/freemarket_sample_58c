class Address < ApplicationRecord
  belongs_to :prefecture, optional: true
  belongs_to :user, optional: true
  has_many :goods
  has_many :deals
             
  validates :family_name,                 presence: true
  validates :first_name,                  presence: true
  validates :family_name_kana,            presence: true
  validates :first_name_kana,             presence: true
  validates :postalcode,                  presence: true
  validates :city,                        presence: true
  validates :building_name,               presence: true
  validates :house_number,                presence: true
  validates :user_id,                     presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end