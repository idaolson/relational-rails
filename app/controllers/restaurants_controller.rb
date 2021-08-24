class RestaurantsController < ApplicationController
  def index
    @restaurants = ['rest1', 'rest2', 'rest3']
  end

  def new
  end

  def create
    restaurant = Restaurant.new({
      created_at: params[:restaurant][:created_at],
      updated_at: params[:restaurant][:updated_at],
      name: params[:restaurant][:name],
      delivery: params[:restaurant][:delivery],
      michelin_stars: params[:restaurant][:michelin_stars],     
      })
    restaurant.save

    redirect_to '/restaurants'
  end
end
