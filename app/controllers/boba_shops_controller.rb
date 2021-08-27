class BobaShopsController < ApplicationController
  def index
    @boba_shops = BobaShop.order_by_creation_time
  end

  def show
    @boba_shop = BobaShop.find(params[:id])
  end

  def new
    
  end

  def create
    boba_shop = BobaShop.new({
      name: params[:name],
      drive_thru: params[:drive_thru],
      capacity: params[:capacity]
    })
    boba_shop.save
    redirect_to '/boba_shops'
  end

  def edit
    @boba_shop = BobaShop.find(params[:id])
  end

  def update
    boba_shop = BobaShop.find(params[:id])
    boba_shop.update({
      name: params[:name],
      drive_thru: params[:drive_thru],
      capacity: params[:capacity]
    })
    boba_shop.save
    redirect_to "/boba_shops/#{boba_shop.id}"
  end
end