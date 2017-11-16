class RemoveCorrectGuessFromGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :correctguess, :string
  end
end
