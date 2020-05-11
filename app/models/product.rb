class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_and_belongs_to_many :orders
  # has_one_attached :image
  has_many_attached :image

  belongs_to :store
  belongs_to :user



  def self.search(search)
    if search
        where(['title LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%"])
    else
        all
    end
  end

  def self.filter(params)
    products = Product.where(category: params[:category])                     if params[:category].present?
    products = Product.where(brand: params[:brand])                           if params[:brand].present?
    products = Product.where(["price <= ?", params[:price].keys.first.to_s])  if params[:price].present?
    products
  end

end

