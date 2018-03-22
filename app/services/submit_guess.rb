# We always name services (commands) VerbNoun

class SubmitGuess
  attr_reader :errors, :game, :letter

  def initialize(game, letter)
    @game = game
    @letter = letter
    @result = {} # Could make an actual object that represents result
  end

  def call
    game.guesses.create(letter: letter)

    # All the logic for submitting a guess goes here
    game.lives -= 1 unless game.word_includes?(letter)

    if game.save
      if game.won?
        Result.won("Congrats")
        # result[:won] = "Congrats"
      elsif game.lost?
        Result.lost("oops")
        # result[:lost] = "You're out of lives buster."
      else
        Result.playing("still going")
        # result[:playing] = ""
      end
    else
      Result.error(game.errors.full_messages)
      # result[:error] = game.errors.full_messages
    end
  end

  class Result
    attr_reader :state, :message

    STATES = [PLAYING, WON, LOST, ERROR]
    PLAYING = "Playing"
    WON = "Won"
    LOST = "Lost"
    ERROR = "Error"

    CORRECT
    INCORRECT

    def initialize(state, message)
      @state = state
      @message = message
    end

    def self.won(message)
      new(WON, message)
    end

    def self.lost(message)
      new(LOST, message)
    end

    def self.playing(message)
      new(PLAYING, message)
    end

    def self.error(message)
      new(ERROR, message)
    end

    def error?
      state == ERROR
    end
  end
end
