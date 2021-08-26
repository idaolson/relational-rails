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
      name: params[:boba_shop][:name],
      drive_thru: params[:boba_shop][:drive_thru],
      capacity: params[:boba_shop][:capacity]
    })
    boba_shop.save
    redirect_to '/boba_shops'
  end
end