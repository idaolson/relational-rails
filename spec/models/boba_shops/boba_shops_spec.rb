require 'rails_helper'

describe BobaShop do
  describe 'associations' do
    it {should have_many :drinks}
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
    end

    it 'can order shops by creation time' do
      expected = [@store_2, @store_1]

      expect(BobaShop.order_by_creation_time).to eq(expected)
    end

    it 'can count the number of drinks' do
      expect(@store_1.drinks_count).to eq(2)
    end

    it 'can sort drinks alphabetically' do
      expected = [
        @drink_2,
        @drink_1
      ]
      
      expect(@store_1.sort_drinks(true)).to eq(expected)
      expect(@store_1.sort_drinks(false)).to eq([@drink_1, @drink_2])
    end
  end
end