class Delivery < ApplicationRecord
  has_many :goods
  has_ancestry
end
