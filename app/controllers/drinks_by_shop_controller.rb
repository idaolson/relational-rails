class DrinksByShopController < ApplicationController
  def index
    @boba_shop = BobaShop.find(params[:id])
    @drinks = Drink.drink_by_shop(params[:id])
  end

  def new
    @boba_shop = BobaShop.find(params[:id])
  end

  def create
    boba_shop = BobaShop.find(params[:id])
    drink = boba_shop.drinks.create!(
      name: params[:name],
      in_stock: params[:in_stock],
      price: params[:price]
    )
    drink.save
    redirect_to "/boba_shops/#{boba_shop.id}/drinks"
  end
end