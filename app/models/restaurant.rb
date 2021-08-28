class Restaurant < ApplicationRecord
  has_many :pastas

  def self.order_by_created_at
    order(created_at: :desc)
  end

  def pasta_count
    pastas.length
  end
end
