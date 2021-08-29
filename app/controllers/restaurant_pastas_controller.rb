class RestaurantPastasController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:id])
    @restaurant_pastas = @restaurant.pastas
  end
end
