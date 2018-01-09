require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    def setup
      @answer = Answer.new(word: "alphabet")
    end

  test "the answer is within the required length" do
    @answer.word = "alphabet" * 3
    assert_not @answer.valid?
  end

  test "the answer only contains valid characters" do
    @answer.word = "3"
    assert_not @answer.valid?
  end
end
