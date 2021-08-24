class CreateRestaurant < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string :name
      t.boolean :delivery
      t.integer :michelin_stars
    end
  end
end
