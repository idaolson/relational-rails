class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.timestamps
      t.string :name
      t.boolean :in_stock
      t.decimal :price
    end
  end
end
