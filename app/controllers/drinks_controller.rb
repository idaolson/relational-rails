class DrinksController < ApplicationController
  def index
    @drinks = Drink.in_stock
  end

  def show
    @drink = Drink.find(params[:drink_id])
  end

  def edit
    @drink = Drink.find(params[:drink_id])
  end

  def update
    drink = Drink.find(params[:drink_id])
    drink.update(drink_params)
    drink.save
    redirect_to "/drinks/#{drink.id}"
  end

  def destroy
    Drink.destroy(params[:drink_id])
    redirect_to "/drinks"
  end

  private

  def drink_params
    params.permit(:name, :in_stock, :price)
  end
end