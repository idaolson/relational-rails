class AddRestaurantToPastas < ActiveRecord::Migration[5.2]
  def change
    add_reference :pastas, :restaurant, foreign_key: true
  end
end
