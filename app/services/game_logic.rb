class GameLogic < GamesController
#placeholder for abstraction logic -
#not appropriate having game logic inside of model/controller

def win_condition
  if (answer_split - correct_guesses.pluck(:letter)).empty?
    byebug
  elsif lives <= 0
    byebug
  else
    byebug
  end
end