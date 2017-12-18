class GamesController < ApplicationController

  def update
    @game = Game.find(params[:id])
    @game.guesses.create!(letter: params[:game][:letter])
    #byebug
    if @game.answer.word.include?(params[:game][:letter])
      flash[:success] = "That Guess was correct"

    else #if @game.incorrect_guesses.include?(params[:game][:letter])
      flash[:failure] = "That Guess was incorrect :("
    end
    redirect_to @game
  end

  def destroy
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create!
    redirect_to @game
  end

end
