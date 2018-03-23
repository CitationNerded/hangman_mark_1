class GamesController < ApplicationController
  #require GameLogic

  def update
    @game = Game.find(params[:id])
    submitter = SubmitGuess.new(@game, params[:game][:letter])

    result = submitter.call

    if result.state == "Error"
      flash.now[:error] = result.message
    else
      flash.now[:state] = result.message
    end
    @game.reload
    render 'show'
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
