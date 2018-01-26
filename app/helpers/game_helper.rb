module GameHelper
  def display_hangman_lives(game)
    #  lives limits are declared here for scenarios where no guesses have been made and when max guesses have been made the image ceases counting
    # and does not attempt to load assets that dont exist
    if (game.lives >= 0) && (game.lives <= 8)
      image_tag(("lives_" + game.lives.to_s + ".png"), :alt => "Progress to death")
    end
  end
end