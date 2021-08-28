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
    drink.update({
      name: params[:name],
      in_stock: params[:in_stock],
      price: params[:price]
    })
    drink.save
    redirect_to "/drinks/#{drink.id}"
  end

  def destroy
    Drink.destroy(params[:drink_id])
    redirect_to "/drinks"
  end
end