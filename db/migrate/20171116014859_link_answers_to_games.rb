class LinkAnswersToGames < ActiveRecord::Migration[5.1]
  def change
    add_reference :games, :answer, foreign_key: true
  end
end
