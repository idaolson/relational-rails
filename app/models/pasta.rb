class Pasta < ApplicationRecord
  belongs_to :restaurant

  def self.is_vegan
    where(is_vegan: true)
  end
end
