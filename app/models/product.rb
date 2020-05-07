class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_and_belongs_to_many :orders
  has_many_attached: image
  belongs_to :store
end
