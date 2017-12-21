module GameHelper
  def display_hangman_lives(game)
    image_tag(("lives_" + game.lives.to_s + ".png"), :alt => "Progress to death")
  end
end