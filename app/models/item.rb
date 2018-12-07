class Item < ApplicationRecord
	belongs_to :product
  belongs_to :purchase
  belongs_to :user

  after_save :update_user

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
end
