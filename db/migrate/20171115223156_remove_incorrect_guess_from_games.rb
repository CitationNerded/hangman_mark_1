class RemoveIncorrectGuessFromGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :incorrectguess, :string
  end
end
