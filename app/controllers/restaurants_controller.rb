require 'date'

class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
  end

  def create
    restaurant = Restaurant.new({
      created_at: date_time,
      updated_at: date_time,
      name: params[:restaurant][:name],
      delivery: params[:restaurant][:delivery],
      michelin_stars: params[:restaurant][:michelin_stars],
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
      updated_at: date_time,
      name: params[:restaurant][:name],
      delivery: params[:restaurant][:delivery],
      michelin_stars: params[:restaurant][:michelin_stars],
      })

    restaurant.save
    redirect_to "/restaurants/#{restaurant.id}"
  end

  def date_time
    DateTime.now.strftime("%d/%m/%Y %H:%M")
  end
end
