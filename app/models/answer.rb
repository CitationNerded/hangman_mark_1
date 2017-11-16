class Answer < ApplicationRecord
  VALID_WORD_REGEX = /\A[a-z]+\z/

  before_validation { word.downcase! }

  validates :word,
    presence: true,
    length: { maximum: 20 },
    format: {
      with: VALID_WORD_REGEX,
      message: "must contain alphabetical characters only",
    }

  has_many :games
end
