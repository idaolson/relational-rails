class Drink < ApplicationRecord
  belongs_to :boba_shop

  def self.drink_by_shop(id)
    where(boba_shop_id: id)
  end
end