class BobaShop < ApplicationRecord
  has_many :drinks

  def self.order_by_creation_time
    order(created_at: :desc)
  end
end
