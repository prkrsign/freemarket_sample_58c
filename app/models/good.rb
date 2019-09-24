class Good < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :brand
    belongs_to_active_hash :category
    belogns_to :user
    has_many :images
    accepts_nested_attributes_for :images
end


