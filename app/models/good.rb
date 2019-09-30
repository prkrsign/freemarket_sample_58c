
class Good < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions

    belongs_to_active_hash        :prefecture
    belongs_to_active_hash        :brand
    belongs_to                    :category
    belongs_to                    :delivery
    belongs_to_active_hash        :condition
    belongs_to_active_hash        :shipment
    has_many                      :images
    belongs_to                    :delivery
    accepts_nested_attributes_for :images
    belongs_to                    :user

    scope :active, -> { order(created_at: :DESC).limit(10) }
    scope :sorted, -> { order(created_at: :ASC).limit(10) }
    scope :recent, -> { includes(:images) }
    scope :mujer, -> { where(brand_id:[147..263]) }
    scope :hombre, -> { where(brand_id:[1..147]) }
    scope :adi, -> { where(brand_id:[5]) }
    scope :nk, -> { where(brand_id:[2]) }
    scope :ysl, -> { where(brand_id:[4]) }
    scope :lv, -> { where(brand_id:[3]) }
    accepts_nested_attributes_for :images
end

