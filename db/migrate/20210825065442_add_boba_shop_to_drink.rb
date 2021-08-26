class AddBobaShopToDrink < ActiveRecord::Migration[5.2]
  def change
    add_reference :drinks, :boba_shop, foreign_key: true
  end
end
