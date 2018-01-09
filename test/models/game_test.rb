require 'test_helper'

class GameTest < ActiveSupport::TestCase
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
    assert @game.guesses.present?
  end

  test "incorrect guesses do not exceed the amount of lives a player has" do

  end

  test "the hangman image correctly correlates to the lives the player has" do

  end

  test "verify at point of initialization that lives equal the constant" do
    assert @game.lives = 8
  end
  test "verify that lives decrease as guesses are made" do
    @game.guesses.create(letter: "y")
    assert @game.lives = 7
  end
end
