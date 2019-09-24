class Good < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :brand
    has_many               :images
    belongs_to             :category
    accepts_nested_attributes_for :images
end


