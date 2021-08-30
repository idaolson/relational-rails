class CreatePasta < ActiveRecord::Migration[5.2]
  def change
    create_table :pasta do |t|
      t.timestamps
      t.string :name
      t.boolean :is_vegan
      t.decimal :price
    end
  end
end
