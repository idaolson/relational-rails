require 'rails_helper'

RSpec.describe Restaurant do
  describe 'associations' do
    it {should have_many :pastas}
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

    it "creates a restaurant" do
      expect(@rest_1).to be_a(Restaurant)
    end

    it 'puts restaurants in order by created_at' do
      expect(Restaurant.order_by_created_at).to eq([@rest_2, @rest_1])
    end

    it 'can count the number of pastas' do
      expect(@rest_1.pasta_count).to eq(2)
      expect(@rest_2.pasta_count).to eq(1)
    end

    it "sorts a restaurant's pastas by name alphabetically" do
      expect(@rest_1.sort_pastas(false)).to eq([@pasta_1, @pasta_2])
      expect(@rest_1.sort_pastas(true)).to eq([@pasta_2, @pasta_1])
    end
  end
end
