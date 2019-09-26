class Good < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions

    belongs_to_active_hash        :prefecture
    belongs_to_active_hash        :brand
    belongs_to                    :category
    belongs_to_active_hash        :condition
    belongs_to_active_hash        :shipment
    has_many                      :images

    accepts_nested_attributes_for :images
end


