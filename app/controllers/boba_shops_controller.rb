class BobaShopsController < ApplicationController
  def index
    @boba_shops = BobaShop.all
  end

  def new
    
  end

  def create
    boba_shop = BobaShop.new({
      created_at: params[:boba_shop][:created_at],
      updated_at: params[:boba_shop][:updated_at],
      name: params[:boba_shop][:name],
      drive_thru: params[:boba_shop][:drive_thru],
      capacity: params[:boba_shop][:capacity]
    })
    boba_shop.save
    redirect_to '/boba_shops'
  end

  def show
    @boba_shop = BobaShop.find(params[:id])
  end
end