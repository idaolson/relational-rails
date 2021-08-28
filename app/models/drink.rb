class Drink < ApplicationRecord
  belongs_to :boba_shop

  def self.in_stock
    where(in_stock: true)
  end
end