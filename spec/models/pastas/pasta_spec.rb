require 'rails_helper'

RSpec.describe Pasta do
  describe 'association' do
    it {should belong_to :restaurant}
  end

  describe 'methods' do
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
      @pasta_1 = Pasta.create!(
        name: "rigatoni",
        is_vegan: false,
        price: 6.99,
        restaurant_id: @rest_1.id,
      )
      @pasta_2 = Pasta.create!(
        name: "bucatini",
        is_vegan: true,
        price: 7.99,
        restaurant_id: @rest_1.id,
      )
      @pasta_3 = Pasta.create!(
        name: "strozzapreti",
        is_vegan: false,
        price: 5.99,
        restaurant_id: @rest_2.id,
      )
      @pastas = Pasta.all
    end

    it "creats a new pasta" do
      expect(@pasta_1).to be_a(Pasta)
    end

    it 'only returns pastas whose price is greater that input' do
      expect(@pastas.filter_by_price("")).to eq([@pasta_1, @pasta_2, @pasta_3])
      expect(@pastas.filter_by_price(6.01)).to eq([@pasta_1, @pasta_2])
    end
  end
end
