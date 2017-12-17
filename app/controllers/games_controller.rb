class GamesController < ApplicationController

  def update
    @game = Game.find(params[:id])

    if @game.guesses.create!(letter: params[:game][:letter])
      redirect_to @game
      flash[:success] = "That Guess was valid"
    else
      redirect_to @game # Handle a successful update.
      flash[:failure] = "Please input a valid guess"
    end
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
