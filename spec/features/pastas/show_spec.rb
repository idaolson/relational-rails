require 'rails_helper'

RSpec.describe "pasta-child show" do
  before(:each) do
    @rest_1 = Restaurant.create!(
      name: "Geraldo's",
      delivery: true,
      michelin_stars: 3,
      )
    @rest_2 = Restaurant.create!(
      name: "Gambardella's",
      delivery: false,
      michelin_stars: 1,
      )
    @pasta_1 = Pasta.create!({
      name: "rigatoni",
      is_vegan: false,
      price: 6.99,
      restaurant_id: @rest_1.id,
      })
    @pasta_2 = Pasta.create!({
      name: "bucatini",
      is_vegan: true,
      price: 7.99,
      restaurant_id: @rest_1.id,
      })
    @pasta_3 = Pasta.create!({
      name: "strozzapreti",
      is_vegan: false,
      price: 5.99,
      restaurant_id: @rest_2.id,
      })
  end
end 