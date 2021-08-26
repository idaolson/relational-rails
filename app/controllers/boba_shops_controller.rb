class BobaShopsController < ApplicationController
  def index
    @boba_shops = BobaShop.order_by_creation_time
  end

  def show
    @boba_shop = BobaShop.find(params[:id])
  end
end