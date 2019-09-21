class Image < ApplicationRecord
  belongs_to :good
  mount_uploader :goods_picture, ImageUploader
end
