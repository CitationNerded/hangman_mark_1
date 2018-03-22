class Game < ApplicationRecord
  INITIAL_LIVES = 7

  has_many :guesses
  belongs_to :answer

  before_validation :assign_answer, :set_lives

  validates :lives, presence: true,
   numericality: { only_integer: true, maximum: 9 }

   def incorrect_guesses
    guesses.map(&:letter).select{ |letter| answer.word.exclude?(letter)}
  end

  def correct_guesses
    guesses.map(&:letter).select{ |letter| answer.word.include?(letter)}
  end

  # Try and split out the two maps to make this easier to read
  def answer_split
    mask = '_'
    answer_mask = answer.word.split("").to_ary
    answer_mask.map{ |answer_letter| answer_letter if (correct_guesses.map {
      |correct_letter| correct_letter.letter} ).include? answer_letter }
  end

  def word_includes?(letter)
    answer.word.include?(letter)
  end

  # Higher level:
  def won?
    win_condition.equal?(:won)
  end

  def lost?
    win_condition.equal?(:lost)
  end

  private

  # Quite low-level
  # Also think about non-numeric ways to represent the return value
  # Also try and make invalid states impossible to represent
  def win_condition
    # values here are used as a form of 'state machine' to manage the 3 possible states the game can have.
    # Ideally i would like to make it so additional guesses cannot be made one a game reaches win or loss conditions
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
