require 'rails_helper'

describe Drink do
  describe 'association' do
    it {should belong_to :boba_shop}
  end

  describe 'methods' do
    before(:each) do
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
      @drink_1 = @store_1.drinks.create!(
        name: 'Okinawan Milk Tea',
        in_stock: true,
        price: 6.99
      )
      @drink_2 = @store_1.drinks.create!(
        name: 'Hazelnut Milk Tea',
        in_stock: false,
        price: 8.99
      )
      @drink_3 = @store_2.drinks.create!(
        name: 'Honey Milk Tea',
        in_stock: true,
        price: 10.99
      )
      @drink_4 = @store_2.drinks.create!(
        name: 'Taro Milk Tea',
        in_stock: false,
        price: 12.99
      )
    end

    it 'can only return drinks that are in stock' do
      drinks = Drink.all
      expected = [@drink_1, @drink_3]

      expect(drinks.in_stock).to eq(expected)
    end

    it 'only return drinks that are above a certain price' do
      drinks = Drink.all
      expect(drinks.filter_by_price(9.99)).to eq([@drink_3, @drink_4])
    end
  end
end