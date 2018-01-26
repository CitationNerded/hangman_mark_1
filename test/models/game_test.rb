require 'test_helper'

class GameTest < ActiveSupport::TestCase
  GUESSES = ("a".."z").to_a
  # test "the truth" do
  #   assert true
  # end
  def setup
    @game = Game.create!
  end

  test "game has an answer associated with it" do
    assert @game.answer.present?
  end

  test "game has guesses associated with it" do
    @game.guesses.create(letter: "a")
    @game.answer
  end

  test "incorrect guesses do not exceed the amount of lives a player has" do
    letters_not_in_answer =  GUESSES - @game.answer.word.chars
    letters_not_in_answer.each{ |letter|
      @game.guesses.create!(letter: letter)
    }
    assert @game.guesses.count <= 8
  end

  test "the hangman image correctly correlates to the lives the player has" do
    #This cant be done here - needs to be in a cuke? as its attempting to reference view logic
  end

  test "verify at point of initialization that lives equal the constant" do
    assert @game.lives = 8
  end
  test "verify that lives decrease as guesses are made" do
    @game.guesses.create(letter: "y")
    assert @game.lives = 7
  end
#should this be done here or in the guess_test model?
  test "duplicate guesses should not be allowed within the same game" do
    @game.guesses.create(letter: "z")
    @game.guesses.create(letter: "z")
    assert @game.guesses.count == 1
  end
end
