module GameHelper
  def display_hangman_lives(game)
    if (game.lives >= 0) && (game.lives <= 8)
      image_tag(("lives_" + game.lives.to_s + ".png"), :alt => "Progress to death")
    end
  end
end