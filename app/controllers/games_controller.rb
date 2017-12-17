class GamesController < ApplicationController

  def update
    @game = Game.find(params[:id])

    if @game.guesses.create!(letter: params[:game][:letter])
      flash[:success] = "That Guess was valid"
      redirect_to @game
    else
      # Handle a successful update.
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
