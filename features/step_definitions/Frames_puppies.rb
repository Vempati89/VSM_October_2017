Given(/^I am on the frames page$/) do
  visit_page(FramesPage)
end

When(/^I send the text "([^"]*)"$/) do |text|
  on(FramesPage).send_message(text)
end

Then(/^the receiver should have "([^"]*)"$/) do |expected|
   expect(on(FramesPage).receiver).to eql expected
end

When(/^I popup the alert$/) do
  on(FramesPage) do |page|
    @alert_text = page.alert_text
  end
end

Then(/^the text from the alert should read "([^"]*)"$/) do |expected|
  expect(@alert_text).to eql expected
end

When(/^I popup the confirm$/) do
  on(FramesPage) do |page|
    @confirm_text = page.confirm_text
  end
end

Then(/^the text from the confirm should read "([^"]*)"$/) do |expected|
  expect(@confirm_text).to eql expected
end

When(/^I popup the prompt and enter "([^"]*)"$/) do |value_enter|
  on(FramesPage) do |page|
    @prompt_response = page.prompt_value(value_enter)
  end
end

Then(/^the message from the prompt should read "([^"]*)"$/) do |message|
  expect(@prompt_response[:message]).to eql message
end

And(/^the default value from the prompt should be "([^"]*)"$/) do |default|
  expect(@prompt_response[:default_value]).to eql default
end

When(/^I popup a window$/) do
  on(FramesPage).popup_a_window
end

Then(/^I should be on a page with the text "([^"]*)"$/) do |expected|
  expect(@current_page.text). to include expected
end

And(/^I should be able to close the popup and return to the original window$/) do
  on(FramesPage).return_from_popup
end