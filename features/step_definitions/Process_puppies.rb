
# for default data
# Given(/^I have a pending adoption for$/) do
#   visit(HomePage)
#   on(HomePage).select_puppy
#   on(DetailsPage).add_to_cart
#   on(ShoppingCartPage).proceed_to_checkout
#   on(CheckOutPage).checkout
#   end

When(/^I process the adoption$/) do
  visit(LandingPage)
  on(LoginPage).login_to_admin
  on(LandingPage).adoptions
  on(ProcessPuppyPage).process_first_puppy
end

Given(/^I have a pending adoption for "([^"]*)"$/) do |name|
  visit(HomePage)
  on(HomePage).select_puppy
  on(DetailsPage).add_to_cart
  on(ShoppingCartPage).proceed_to_checkout
  on(CheckOutPage).checkout('name' => name)
end