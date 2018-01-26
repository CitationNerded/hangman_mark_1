class Guess < ApplicationRecord
  VALID_LETTER_REGEX = /\A[a-z]{1}\z/

  #validates :has_lives, on: :create
  validates :letter,
  presence: true,
  # This works for validating uniqueness at the game level but it still submits the duplicate to the Incorrect_guesses layer even if it doesnt persist the duplicate guess
  uniqueness: { scope: :game, },
  format: {
    with: VALID_LETTER_REGEX,
    message: "must be a single alpha character",
  }


  belongs_to :game
  validate :has_lives, on: :create
  after_save :update_lives

  def update_lives
    if self.game.answer.word.include?(letter)
      self.game.lives
    else
      self.game.lives -= 1
      self.game.save unless self.game.valid?
    end
  end

  def has_lives
    if self.game.lives <= 0
      errors.add(:loss, "You're out of lives buster.")
    end
  end
end
