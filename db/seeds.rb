# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

BobaShop.destroy_all
Drink.destroy_all
Restaurant.destroy_all
Pasta.destroy_all

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
  price: 10.99
)
@drink_2 = @store_1.drinks.create!(
  name: 'Hazelnut Milk Tea',
  in_stock: true,
  price: 6.99
)
@drink_3 = @store_1.drinks.create!(
  name: 'Hokkaido Milk Tea',
  in_stock: true,
  price: 9.99
)
@drink_4 = @store_2.drinks.create!(
  name: 'Taro Milk Tea',
  in_stock: true,
  price: 6.99
)
@drink_5 = @store_2.drinks.create!(
  name: 'Jasmine Milk Tea',
  in_stock: true,
  price: 9.99
)
@drink_6 = @store_2.drinks.create!(
  name: 'Black Milk Tea',
  in_stock: true,
  price: 11.99
)


# restaurants
@rest_1 = Restaurant.create!(
  name: "Geraldo's",
  delivery: true,
  michelin_stars: 3
)
@rest_2 = Restaurant.create!(
  name: "Gambardella's",
  delivery: false,
  michelin_stars: 1
)
@pasta_1 = Pasta.create!(
  name: 'rigatoni',
  is_vegan: false,
  price: 6.99,
  restaurant_id: @rest_1.id
)
@pasta_2 = Pasta.create!(
  name: 'bucatini',
  is_vegan: true,
  price: 7.99,
  restaurant_id: @rest_1.id
)
@pasta_3 = Pasta.create!(
  name: 'strozzapreti',
  is_vegan: false,
  price: 5.99,
  restaurant_id: @rest_1.id
)
@pasta_4 = Pasta.create!(
  name: 'orecchiette',
  is_vegan: true,
  price: 8.99,
  restaurant_id: @rest_2.id
)
@pasta_5 = Pasta.create!(
  name: 'orzo',
  is_vegan: false,
  price: 4.59,
  restaurant_id: @rest_2.id
)
@pasta_6 = Pasta.create!(
  name: 'farfalle',
  is_vegan: true,
  price: 10.03,
  restaurant_id: @rest_2.id
)
