class CreateGuesses < ActiveRecord::Migration[5.1]
  def change
    create_table :guesses do |t|
      t.string :letter
      t.references :game

      t.timestamps
    end
  end
end
