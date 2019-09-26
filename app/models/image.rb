class Image < ApplicationRecord
  belongs_to :good, optional: true
  mount_uploader :goods_picture, ImageUploader
end
