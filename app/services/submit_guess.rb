class SubmitGuess
      attr_reader :errors, :game, :letter

      def initialize(game, letter)
        #byebug
        @game = game
        @letter = letter
        @result = Result # Could make an actual object that represents result
      end

      def call
        game.guesses.create(letter: letter)
        game.lives -= 1 unless game.word_includes?(letter)

        if game.save
          if game.won?
            Result.won("You Win")
          elsif game.lost?
            Result.lost("You Lost")
          else
            if game.word_includes?(letter)
              Result.playing("That was a Correct Guess")
            else
              Result.playing("That was an Incorrect Guess")
            end
          end
        else
          Result.error(game.errors.full_messages)
        end
      end

      class Result
        attr_reader :state, :message

        PLAYING = "Playing"
        WON = "Won"
        LOST = "Lost"
        ERROR = "Error"
        STATE = [PLAYING, WON, LOST, ERROR]

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