class PastasController < ApplicationController
  def index
    @pastas = ['pasta', 'PASTA', 'PASTA!!!']
  end
end
