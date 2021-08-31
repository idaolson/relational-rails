class AddRestaurantPastaForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_reference :pasta, :restaurant, foreign_key: true
  end
end
