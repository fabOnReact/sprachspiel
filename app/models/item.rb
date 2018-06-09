class Item < ApplicationRecord
	belongs_to :product
  belongs_to :purchase
  belongs_to :user
  # belongs_to :property

  after_save :update_user

  # def amount
  #   self.amount.to_i
  # end

  # def self.where_limit(product_id, room_id, nitems)
  # 	Item.where(product_id: product_id, sold: false, room_id: room_id).limit(nitems)
  # end

  def prop_amount
    product.property.amount
  end

  def prop_name
    Property::ACCESSORS[product.property.name.to_sym]
  end

  def update_user
    user[prop_name] += prop_amount
    user.save
  end

  # def used!
  # 	self.update_attributes(used: true)
  # end
end
