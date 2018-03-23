class Game < ApplicationRecord
  INITIAL_LIVES = 7

  has_many :guesses
  belongs_to :answer

  before_validation :assign_answer, :set_lives

  validates :lives, presence: true,
   numericality: { only_integer: true, maximum: 9 }

   def incorrect_guesses
    guesses.select{ |guess| answer.word.exclude?(guess.letter)}
  end

  def correct_guesses
    guesses.select{ |guess| answer.word.include?(guess.letter)}
  end

  def answer_split
    answer_mask = answer.word.split("").to_ary
     answer_mask.map{ |letter| letter if
       correct_guesses.pluck(:letter)
        .include?(letter)
     }
  end

  def word_includes?(letter)
    answer.word.include?(letter)
    #byebug
  end

  def won?
    win_condition.equal?(:won)
  end

  def lost?
    win_condition.equal?(:lost)
  end

  private

  def win_condition
    if (answer_split - correct_guesses.pluck(:letter)).empty?
      :won
    elsif lives <= 0
      :lost
    else
      :playing
    end
  end

  def assign_answer
    unless answer
      self.answer = Answer.find(Answer.pluck(:id).sample)
    end
  end

  def set_lives
    if guesses.count == 0
      self.lives = INITIAL_LIVES
    end
  end
end
