class CreateBobaShop < ActiveRecord::Migration[5.2]
  def change
    create_table :boba_shops do |t|
      t.timestamps
      t.string :name
      t.boolean :drive_thru
      t.integer :capacity
    end
  end
end
