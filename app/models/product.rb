class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_and_belongs_to_many :orders
  # has_one_attached :image
  has_many_attached :image

  belongs_to :store
  belongs_to :user

  # form do |f|
  #   f.inputs do
  #   f.input :category_id, as: :select, collection: Category.all.map 
  #   # f.input :name
  #   # f.input :summary
  #   end
  #   f.actions 
  # end
end
