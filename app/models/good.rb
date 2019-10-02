
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
    accepts_nested_attributes_for :images, allow_destroy: true
    belongs_to                    :user

    scope :active, -> { order(created_at: :DESC).limit(10) }
    scope :sorted, -> { order(created_at: :ASC).limit(10) }
    scope :recent, -> { includes(:images) }
    scope :mujer, -> { where(category_id:[147..263]) }
    scope :hombre, -> { where(category_id:[1..146]) }
    scope :adi, -> { where(brand_id:[5]) }
    scope :nk, -> { where(brand_id:[2]) }
    scope :ysl, -> { where(brand_id:[4]) }
    scope :lv, -> { where(brand_id:[3]) }
    accepts_nested_attributes_for :images

    validates :goods_name, presence: true, length: { maximum: 40 }
    validates :description, presence: true, length: { maximum: 1000 }
    validates :category_id, presence: { message: "選択して下さい" }
    validates :brand_id, presence: { message: "選択して下さい" }
    validates :condition_id, presence: { message: "選択して下さい" }
    validates :delivery_id, presence: { message: "選択して下さい" }
    validates :prefecture_id, presence: { message: "選択して下さい" }
    validates :shipment_id, presence: { message: "選択して下さい" }
    validates :price, 
      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "販売価格は300以上9,999,999以内で入力してください" }
    validates :user_id, presence: true
end

