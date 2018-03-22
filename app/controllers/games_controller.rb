class GamesController < ApplicationController
  #require GameLogic

  def update
    @game = Game.find(params[:id])
    @game.guesses.create(letter: params[:game][:letter])
    if @game.save
      if @game.answer.word.include?(params[:game][:letter])
        flash[:success] = "That Guess was correct"
        if (@game.win_condition.equal?(1))
          flash[:win] = ""
        end
      else
        flash[:incorrect] = "That Guess was incorrect :("
        if (@game.win_condition.equal?(-1))
          flash[:loss] = ""
        end
      end
      render 'show'
    else
      @game.reload
      render 'show'
    end
  end

  def destroy
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.create!
    redirect_to @game
  end

  def index

  end
end
