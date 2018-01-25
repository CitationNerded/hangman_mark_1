Feature: A hangman game can be run to the end
Scenario: The User Manages to start a game
  Given I navigate to home page
  And I click the new game
  Then I should see a new game displayed

Scenario: The User manages to win a game
  Given I navigate to home page
  And I click the new game
  When I input my guess of "m"
  And I input my guess of "y"
  And I input my guess of "s"
  And I input my guess of "t"
  And I input my guess of "r"
  And I input my guess of "i"
  And I input my guess of "n"
  And I input my guess of "g"
  Then I should see a congratulations message

Scenario: The User Manages to Lose a game
  Given I navigate to home page
  And I click the new game
  When I input my guess of "a"
  And I input my guess of "b"
  And I input my guess of "c"
  And I input my guess of "d"
  And I input my guess of "e"
  And I input my guess of "f"
  And I input my guess of "z"
  And I input my guess of "y"
  And I input my guess of "x"
  And I input my guess of "z"
  And I input my guess of "y"
  And I input my guess of "x"
  Then I should see a failure message