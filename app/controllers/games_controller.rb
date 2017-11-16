class GamesController < ApplicationController

  # def game_setup
  #   @game = Game.new(lives: 10)
  #   @keyword = Answer.all.sample.word
  #   #@guess = ''
  # end

  # def create #not start
  #   #This initializes the beginning of the game by setting the secret word and your starting lives
  #   game_setup

  #   # if @keyword.contains(@guess)
  #   #   @correctguess += @guess
  #   #   if @correctguess.contains(@keyword)
  #   #     return true
  #   #   end
  #   # elsif @guess != @keyword
  #   #   @game.lives -= 1
  #   #   @incorrectguess += @guess
  #   # else
  #   #   return true
  #   # end
  # end
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
