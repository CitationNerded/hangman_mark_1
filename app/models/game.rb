class Game < ApplicationRecord
  has_many :guesses
  has_one :answer
  #put logic of correct/incorrect guess here. NOT IN DB

  #DB - separate out the game/guess structure

  validates :lives, presence: true,
   numericality: { only_integer: true, maximum: 9 }
end
