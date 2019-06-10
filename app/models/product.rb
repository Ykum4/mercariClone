class Product < ApplicationRecord
  belongs_to :area
  belongs_to :user
  belongs_to :product_size
  belongs_to :category
  belongs_to :brand

end
