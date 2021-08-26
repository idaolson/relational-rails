class DrinksController < ApplicationController
  def index
    @drinks = Drink.all
  end

  def show
    @drink = Drink.find(params[:id])
  end

  def drinks_by_shop
    @boba_shop = BobaShop.find(params[:id])
    @drinks = Drink.drink_by_shop(params[:id])
  end
end