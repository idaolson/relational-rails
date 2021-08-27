class DrinksController < ApplicationController
  def index
    @drinks = Drink.all
  end

  def show
    @drink = Drink.find(params[:id])
  end

  def edit
    @drink = Drink.find(params[:id])
  end

  def update
    drink = Drink.find(params[:id])
    drink.update({
      name: params[:name],
      in_stock: params[:in_stock],
      price: params[:price]
    })
    drink.save
    redirect_to "/drinks/#{drink.id}"
  end
end