class DrinksByShopController < ApplicationController
  def index
    @boba_shop = BobaShop.find(params[:id])
    @drinks = Drink.drink_by_shop(params[:id])
  end
end