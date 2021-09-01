class PastasController < ApplicationController
  def index
    @pastas = Pasta.is_vegan
  end

  def new
  end

  def show
    @pasta = Pasta.find(params[:id])
  end

  def edit
    @pasta = Pasta.find(params[:id])
  end

  def update
    pasta = Pasta.find(params[:id])
    pasta.update(params.permit(:name, :is_vegan, :price))
    pasta.save
    redirect_to "/pastas/#{pasta.id}"
  end

  def destroy
    pasta = Pasta.find(params[:id])
    pasta.destroy!
    redirect_to '/pastas'
  end
end
