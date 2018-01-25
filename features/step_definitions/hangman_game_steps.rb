require "selenium-webdriver"

driver = Selenium::WebDriver.for :chrome
#driver.navigate.to "localhost:3000"

Given("I navigate to home page") do
  visit "/"
end

And("I click the new game") do
  p page.body
  click_on("New Game")
end

# When(/^I click the element matching css="(.*)"$/) do |selector|
#   click_on(driver.find_element(:css, selector))
# end

Then("I should see a new game displayed") do
  expect(page).to have_content("You have 8 lives remaining")
  #pending # Write code here that turns the phrase above into concrete actions
end

When("I input my guess of {string}") do |string|
  fill_in 'game_letter', with: string
  click_on("Submit")
  #pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see a congratulations message") do
  byebug
  expect(page).to have_content("You win. Congrats I guess.")
  #pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see a failure message") do
  expect(page).to have_content("How did you lose?")
  #pending # Write code here that turns the phrase above into concrete actions
end

Then /^pause$/ do
  STDOUT.puts "Hit Enter to continue..."
  STDIN.gets
end

