class Address < ApplicationRecord
  belongs_to :prefecture, optional: true
  belongs_to :user, optional: true
  has_many :goods
  has_many :deals

  validates :postalcode, :city, :building_name, :house_number, presence: true


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end