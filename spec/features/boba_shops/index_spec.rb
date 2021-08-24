require 'rails_helper'
require 'date'

RSpec.describe 'boba shops index page' do
  before(:each) do
    @store_1 = Shop.create(
      id: 1,
      created_at: Date.today.strftime('%d%m%y'),
      updated_at: Date.today.strftime('%d%m%y'),
      name: 'Sharetea',
      drive_thru: false,
      capacity: 25
    )
    @store_2 = Shop.create(
      id: 2,
      created_at: Date.today.strftime('%d%m%y'),
      updated_at: Date.today.strftime('%d%m%y'),
      name: 'Cha2o',
      drive_thru: false,
      capacity: 50
    )
  end
  
  it 'can see all boba shops' do
    visit '/songs'

    expect(page).to have_content(@store_1.name)
    expect(page).to have_content(@store_2.name)
  end
end