class Game < ApplicationRecord
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

  def compare_answer
    mask = ('_' * answer.word.length).strip.split("")
    broken_answer = answer.word.strip.split("")
    broken_answer.map{ |answer_letter| "_" unless answer_letter.include?(correct_guesses.map { |correct_letter| correct_letter.letter} )}
    #byebug
    # answer_split = answer.split("").map { |letter| letter}
    # .answer.word.include?(params[:game][:letter])
    #This section needs a .each/.map.. potentially nested in a .each to go through
    #each guess & answer position and compare them...
  end

  def answer_split
    answer_mask = answer.word.split("").to_ary

    #byebug
   # answer_mask.map{ |answer_letter| answer_letter if answer_letter.include?(correct_guesses.each { |correct_letter| correct_letter.letter} )}
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
      self.lives = 9
    end
  end
end
