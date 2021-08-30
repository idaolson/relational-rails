class BobaShop < ApplicationRecord
  has_many :drinks, dependent: :destroy

  def self.order_by_creation_time
    order(created_at: :desc)
  end

  def drinks_count
    drinks.count
  end

  def sort_drinks(sort = false)
    if sort
      drinks.order(:name)
    else
      drinks
    end
  end
end
