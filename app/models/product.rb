class Product < ApplicationRecord
  belongs_to :sub_category
  has_one_attached :image
  has_one_attached :thumbnail
end
