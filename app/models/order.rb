class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :products

  def placed?
    self.orderstate =='placed'
  end
  def close 
    self.orderstate = 'placed'
    save!
  end
end
