class Game < ApplicationRecord
  INITIAL_LIVES = 7

  has_many :guesses
  belongs_to :answer

  before_validation :assign_answer, :set_lives

  validates :lives, presence: true,
   numericality: { only_integer: true, maximum: 9 }

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
  end

  def win_condition
    # values here are used as a form of 'state machine' to manage the 3 possible states the game can have.
    # Ideally i would like to make it so additional guesses cannot be made one a game reaches win or loss conditions
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

  def set_lives
    if guesses.count == 0
      self.lives = INITIAL_LIVES
    end
  end
end
