require 'rails_helper'
require 'date'

describe BobaShop do
  describe 'methods' do
    before(:each) do
      @time = DateTime.now
      @store_1 = BobaShop.create!(
        id: 1,
        created_at: @time.strftime('%d%m%y %H:%M:%S'),
        updated_at: @time.strftime('%d%m%y %H:%M:%S'),
        name: 'Sharetea',
        drive_thru: false,
        capacity: 25
      )
      @store_2 = BobaShop.create!(
        id: 2,
        created_at: (@time + 1.hour).strftime('%d%m%y %H:%M:%S'),
        updated_at: (@time + 1.hour).strftime('%d%m%y %H:%M:%S'),
        name: 'Cha4Tea',
        drive_thru: false,
        capacity: 25
      )
      @drink_1 = @store_1.drinks.create!(
        id: 1,
        created_at: @time.strftime('%d%m%y %H:%M:%S'),
        updated_at: @time.strftime('%d%m%y %H:%M:%S'),
        name: 'Okinawan Milk Tea',
        in_stock: true,
        price: 6.99
      )
      @drink_2 = @store_1.drinks.create!(
        id: 2,
        created_at: @time.strftime('%d%m%y %H:%M:%S'),
        updated_at: @time.strftime('%d%m%y %H:%M:%S'),
        name: 'Hazelnut Milk Tea',
        in_stock: true,
        price: 6.99
      )
      @drink_3 = @store_2.drinks.create!(
        id: 3,
        created_at: (@time + 1.hour).strftime('%d%m%y %H:%M:%S'),
        updated_at: (@time + 1.hour).strftime('%d%m%y %H:%M:%S'),
        name: 'Honey Milk Tea',
        in_stock: true,
        price: 6.99
      )
      @drink_4 = @store_2.drinks.create!(
        id: 4,
        created_at: (@time + 1.hour).strftime('%d%m%y %H:%M:%S'),
        updated_at: (@time + 1.hour).strftime('%d%m%y %H:%M:%S'),
        name: 'Taro Milk Tea',
        in_stock: true,
        price: 6.99
      )
    end

    it '#drinks_count' do
      expect(@store_1.drinks_count).to eq(2)
    end
  end
end