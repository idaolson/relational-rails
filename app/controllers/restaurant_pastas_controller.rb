class RestaurantPastasController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:id])
    @restaurant_pastas = @restaurant.sort_pastas(params[:sort]).filter_by_price(params[:price])
  end

  def new
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    pasta = Pasta.new(params.permit(:name, :is_vegan, :price, :restaurant_id))
    pasta.save
    redirect_to "/restaurants/#{params[:restaurant_id]}/pastas"
  end
end
