class DrinksByShopController < ApplicationController
  def index
    @boba_shop = BobaShop.find(params[:shop_id])
    @price = params[:price]
    @drinks = @boba_shop.sort_drinks(params[:sort]).filter_by_price(@price)
  end

  def show
    @boba_shop = BobaShop.find(params[:shop_id])
    @drink = @boba_shop.drinks.find(params[:drink_id])
  end

  def new
    @boba_shop = BobaShop.find(params[:shop_id])
  end

  def create
    boba_shop = BobaShop.find(params[:shop_id])
    drink = boba_shop.drinks.create!(
      name: params[:name],
      in_stock: params[:in_stock],
      price: params[:price]
    )
    drink.save
    redirect_to "/boba_shops/#{boba_shop.id}/drinks"
  end

  def update
    boba_shop = BobaShop.find(params[:shop_id])
    drink = boba_shop.drinks.find(params[:drink_id])
    drink.update({
      name: params[:name],
      in_stock: params[:in_stock],
      price: params[:price]
    })
    drink.save
    redirect_to "/boba_shops/#{boba_shop.id}/drinks"
  end

  def edit
    @boba_shop = BobaShop.find(params[:shop_id])
    @drink = @boba_shop.drinks.find(params[:drink_id])
  end

  def destroy
    boba_shop = BobaShop.find(params[:shop_id])
    boba_shop.drinks.destroy(params[:drink_id])
    redirect_to "/boba_shops/#{boba_shop.id}/drinks"
  end
end