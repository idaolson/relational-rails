class Drink < ApplicationRecord
  belongs_to :boba_shop

  def self.in_stock
    where(in_stock: true)
  end

  def self.filter_by_price(price)
    price = 0 if price == "" || price == nil
    where("price > #{price}")
  end
end