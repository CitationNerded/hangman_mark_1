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


  # This business logic, not data validation.

  # Validations verify that our stored data doesn't become malformed or
  # nonsensical.

  # Business logic is for deciding legitimate application state.

  # In this case, it's a perfectly valid state for the user to have 0
  # lives, that just means they've lost the game.

  # def has_lives
  #   if game.lives <= 0
  #     errors.add(:loss, "You're out of lives buster.")
  #   end
  # end
end
