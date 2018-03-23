class GamesController < ApplicationController
  #require GameLogic

  def update
    @game = Game.find(params[:id])
    submitter = SubmitGuess.new(@game, params[:game][:letter])

    result = submitter.call

    if result.state == "Error"
      flash.now[:error] = result.message
    else
      if @game.save
        if @game.word_includes?(params[:game][:letter])
          flash.now[:state] = result.message
          #flash.now[:won] = result.state if @game.won?
        else
          flash.now[:state] = result.message
          #flash.now[:lost] = result.state if @game.lost?
        end
      end
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
