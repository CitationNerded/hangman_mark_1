class Game < ApplicationRecord
  has_many :guesses
  belongs_to :answer

  before_validation :assign_answer

  validates :lives, presence: true,
   numericality: { only_integer: true, maximum: 9 }

  private

  def assign_answer
    unless answer
      self.answer = Answer.find(Answer.pluck(:id).sample)
    end
  end
end
