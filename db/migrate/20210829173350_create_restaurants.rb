class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.timestamps
      t.string :name
      t.boolean :delivery
      t.integer :michelin_stars
    end
  end
end
