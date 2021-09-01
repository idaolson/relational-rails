class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.order_by_created_at
  end

  def new
  end

  def create
    restaurant = Restaurant.new(params.permit(:name, :delivery, :michelin_stars))
    restaurant.save
    redirect_to '/restaurants'
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    restaurant = Restaurant.find(params[:id])
    restaurant.update(params.permit(:name, :delivery, :michelin_stars))
    restaurant.save
    redirect_to "/restaurants/#{restaurant.id}"
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy!
    redirect_to "/restaurants"
  end
end
