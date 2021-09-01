class Pasta < ApplicationRecord
  belongs_to :restaurant

  def self.is_vegan
    where(is_vegan: true)
  end

  def self.filter_by_price(entry)
    if entry == nil || entry == ''
      entry = 0
    end

    where("price > #{entry}")
  end
end
