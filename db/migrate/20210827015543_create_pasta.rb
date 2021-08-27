class CreatePasta < ActiveRecord::Migration[5.2]
  def change
    create_table :pasta do |t|
      t.timestamps
      t.string :name
      t.boolean :is_vegan
      t.decimal :price
      t.references :restaurant, foreign_key: true
    end
  end
end
