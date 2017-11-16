class Guess < ApplicationRecord
  VALID_LETTER_REGEX = /\A[a-z]{1}\z/

  validates :letter,
  presence: true,
  format: {
    with: VALID_LETTER_REGEX,
    message: "must be a single alpha character",
  }

  belongs_to :game
end
