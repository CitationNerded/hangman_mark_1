class GamesController < ApplicationController
  #require GameLogic

  def update
    @game = Game.find(params[:id])

    submitter = SubmitGuess.new(@game, params[:game][:letter])

    result = submitter.call

    if result.error?

    else
      if result.won?

      end
    end


    if @game.save
      # Think about wrapping this up:
      if @game.word_includes?(params[:game][:letter])
        flash.now[:success] = "That Guess was correct"
      else
        flash.now[:incorrect] = "That Guess was incorrect :("
      end
    else
      @game.reload
    end

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
