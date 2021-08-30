class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.order_by_created_at
  end

  def create
    restaurant = Restaurant.new({
      name: params[:name],
      delivery: params[:delivery],
      michelin_stars: params[:michelin_stars],
      })
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

    restaurant.update({
      name: params[:name],
      delivery: params[:delivery],
      michelin_stars: params[:michelin_stars],
      })

    restaurant.save
    redirect_to "/restaurants"
  end
end
