class CreateBobaShop < ActiveRecord::Migration[5.2]
  def change
    create_table :boba_shops do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string :name
      t.boolean :delivery
      t.integer :capacity
    end
  end
end
