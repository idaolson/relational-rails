require 'rails_helper'

describe 'boba shops show page' do
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

  it 'can see the its attributes' do
    visit "/boba_shops/#{@store_1.id}"

    expect(page).to have_content(@store_1.id)
    expect(page).to have_content(@store_1.name)
    expect(page).to have_content(@store_1.created_at)
    expect(page).to have_content(@store_1.updated_at)
    expect(page).to have_content(@store_1.drive_thru)
    expect(page).to have_content(@store_1.capacity)
  end

  it 'can count the number of drinks the shop has' do
    visit "/boba_shops/#{@store_1.id}"

    expect(page).to have_content(@store_1.drinks_count)
  end

  it 'has a link that redirects to the boba shops drinks' do
    visit "/boba_shops/#{@store_1.id}"
    expect(has_link?("View Drinks")).to eq(true)
    
    click_on "View Drinks"
    expect(current_path).to eq("/boba_shops/#{@store_1.id}/drinks")
  end

  it 'has a link to update a boba shop' do
    visit "/boba_shops/#{@store_1.id}"
    expect(has_link?("Update #{@store_1.name}")).to eq(true)
    
    click_on "Update #{@store_1.name}"
    expect(current_path).to eq("/boba_shops/#{@store_1.id}/edit")

    fill_in :name, with: 'Gong Cha'
    choose :drive_thru_true
    fill_in :capacity, with: '15'

    click_on "Update #{@store_1.name}"
    expect(current_path).to eq("/boba_shops/#{@store_1.id}")
  end

  it 'has a link to delete a boba shop' do
    visit "/boba_shops/#{@store_1.id}"
    expect(has_link?("Delete #{@store_1.name}")).to eq(true)

    click_on "Delete #{@store_1.name}"
    expect(has_no_content?("#{@store_1.name}")).to eq(true)
  end
end