# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# boba shops
@store_1 = BobaShop.create!(
  name: 'Sharetea',
  drive_thru: false,
  capacity: 25
)
@store_2 = BobaShop.create!(
  name: 'Cha4Tea',
  drive_thru: false,
  capacity: 25
)

# drinks
@drink_1 = @store_1.drinks.create!(
  name: 'Okinawan Milk Tea',
  in_stock: true,
  price: 6.99
)
@drink_2 = @store_1.drinks.create!(
  name: 'Hazelnut Milk Tea',
  in_stock: true,
  price: 6.99
)
@drink_3 = @store_2.drinks.create!(
  name: 'Honey Milk Tea',
  in_stock: true,
  price: 6.99
)
@drink_4 = @store_2.drinks.create!(
  name: 'Taro Milk Tea',
  in_stock: true,
  price: 6.99
)