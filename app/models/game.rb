class Game < ApplicationRecord
  INITIAL_LIVES = 8

  has_many :guesses
  belongs_to :answer

  before_validation :assign_answer, :set_lives

  validates :lives, presence: true,
   numericality: { only_integer: true, maximum: 9 }

# it can provide a default value here (instead of using a constant where possible
  def incorrect_guesses
    guesses.select{ |guess| guess.letter if answer.word.exclude?(guess.letter)}
  end

  def correct_guesses
    guesses.select{ |guess| guess.letter if answer.word.include?(guess.letter)}
  end

  def answer_split
    mask = '_'
    answer_mask = answer.word.split("").to_ary
    answer_mask.map{ |answer_letter| answer_letter if (correct_guesses.map {
      |correct_letter| correct_letter.letter} ).include? answer_letter }

    # This currently works but unrevealed answers are currently set to nil instead of "_".
    # This is sufficient for functionality but not suitable for UX.
    # EDIT: Andrew helped me and now it does this at a view layer.
  end

  def win_condition
    if (answer_split - correct_guesses.pluck(:letter)).empty?
      return 1
    elsif lives <= 0
      return -1
    else
      return 0
    end
  end

  private

  def assign_answer
    unless answer
      self.answer = Answer.find(Answer.pluck(:id).sample)
    end
  end

  #before create may be more appropriate here
  def set_lives
    if guesses.count == 0
      self.lives = INITIAL_LIVES
    end
  end
end
