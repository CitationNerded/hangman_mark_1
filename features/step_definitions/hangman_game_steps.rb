Given("I navigate to home page") do
  visit "/"
end

And("I click the new game") do
  click_on("New Game")
end

Then("I should see a new game displayed") do
  expect(page).to have_content("You have 8 lives remaining")
end

When("I input my guess of {string}") do |string|
  fill_in 'game_letter', with: string
  click_on("Submit")
end

Then("I should see a congratulations message") do
  expect(page).to have_content("You win. Congrats I guess.")
end

Then("I should see a failure message") do
  expect(page).to have_content("How did you lose?")
end

Then /^pause$/ do
  STDOUT.puts "Hit Enter to continue..."
  STDIN.gets
end

