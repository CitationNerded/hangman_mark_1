class GamesController < ApplicationController

  def update
  end

  def destroy
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end
end
