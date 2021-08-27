class PastasController < ApplicationController
  def index
    @pastas = Pasta.all
  end

  def create
    pasta = Pasta.new({
      name: params[:pasta][:name],
      is_vegan: params[:pasta][:is_vegan],
      price: params[:pasta][:price],
      restaurant_id: params[:pasta][:restaurant_id],
      })

    pasta.save

    redirect_to '/pastas'
  end

  def show
    @pasta = Pasta.find(params[:id])
  end
end
