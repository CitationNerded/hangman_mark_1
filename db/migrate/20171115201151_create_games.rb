class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :lives
      t.string :correctguess
      t.string :incorrectguess

      t.timestamps
    end
  end
end
