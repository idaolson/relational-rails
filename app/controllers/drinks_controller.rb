class DrinksController < ApplicationController
  def index
    @drinks = Drink.all
  end

  def show
    @drink = Drink.find(params[:id])
  end

  def drinks_by_shop
    @boba_shop = BobaShop.find(params[:id])
    @drinks = Drink.where(boba_shop_id: params[:id])
  end
end