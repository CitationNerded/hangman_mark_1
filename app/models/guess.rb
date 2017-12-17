class Guess < ApplicationRecord
  VALID_LETTER_REGEX = /\A[a-z]{1}\z/

  validates :letter,
  presence: true,
  uniqueness: true,
  format: {
    with: VALID_LETTER_REGEX,
    message: "must be a single alpha character",
  }

  belongs_to :game
  after_save :update_lives

  def update_lives
    if self.game.answer.word.include?(letter)
      #self.game.lives
    else
      self.game.lives -= 1
      self.game.save
    end
  end
end
