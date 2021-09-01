class Restaurant < ApplicationRecord
  has_many :pastas, dependent: :destroy

  def self.order_by_created_at
    order(created_at: :desc)
  end

  def pasta_count
    pastas.length
  end

  def sort_pastas(sort = false)
    if sort
      pastas.order(:name)
    else
      pastas
    end
  end
end
