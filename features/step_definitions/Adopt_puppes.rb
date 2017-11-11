Given(/^I am on the puppy adoption site$/) do
  # @browser.goto 'http://puppies.herokuapp.com'
  # @home = HomePage.new(@browser)
  visit(HomePage)
end

When(/^I click the View Details button for "([^"]*)"$/) do |name|
  # @browser.button(:value => 'View Details' , :index => 0).click
  # @home.select_puppy_number (1)
  # @details = DetailsPage.new(@browser)
  on(HomePage).select_puppy name
end

And(/^I click on Adopt me button$/) do
  # @browser.button(:value => 'Adopt Me!').click
  # @details.add_to_cart
  # @cart = ShoppingCartPage.new(@browser)
  on(DetailsPage).add_to_cart
end

And(/^I click on Complete adoption button$/) do
  # @cart.proceed_to_checkout
  # @checkout = CheckoutPage.new(@browser)
  on(ShoppingCartPage).proceed_to_checkout
end

And(/^I enter "([^"]*)" in the Name field$/) do |name|
# @checkout.name =(name)
  on(CheckOutPage).name = name
end

And(/^I enter "([^"]*)" in the address field$/) do |address|
# @checkout.address =(address)
  on(CheckOutPage).address = address
end

And(/^I enter "([^"]*)" in the email field$/) do |email|
# @checkout.email =(email)
  on(CheckOutPage).email = email
end

And(/^I select "([^"]*)" from the pay type drop down$/) do |pay_type|
# @checkout.pay_type =(pay_type)
  on(CheckOutPage).pay_type = pay_type
end

And(/^I click on Place Order button$/) do
# @checkout.place_order
  on(CheckOutPage).place_order
end

Then(/^I should see "([^"]*)"$/) do |expected|
  # expect(@browser.text).to include expected
  expect(@current_page.text).to include expected
end

And(/^I click the Adopt Another Puppy button$/) do
# @cart.continue_shopping
  on(ShoppingCartPage).continue_shopping
end

# And(/^I click the second View Details button$/) do
#   # @browser.button(:value => 'View Details' , :index => 1).click
#   @home.select_puppy_number(2)
#   @details = DetailsPage.new(@browser)
# end

Then(/^I should see "([^"]*)" as the name for line item (\d+)$/) do |name, line_item|
  # expect(cart_line_item(line_item.to_i)[1].text).to include name
  # expect(@cart.name_line_item(line_item.to_i)).to include name
  expect(on(ShoppingCartPage).name_line_item(line_item.to_i)).to include name
end


And(/^I should see "([^"]*)" as the subtotal for line item (\d+)$/) do |subtotal, line_item|
  # expect(cart_line_item(line_item.to_i)[3].text).to eql subtotal
  # expect(@cart.subtotal_line_item(line_item.to_i)).to eql subtotal
  expect(on(ShoppingCartPage).subtotal_line_item(line_item.to_i)).to eql subtotal
end


And(/^I should see "([^"]*)" as the cart total$/) do |total|
  # expect(@browser.td(:class => 'total_cell').text).to eql total
  # expect(@cart.cart_total).to eql total
  expect(on(ShoppingCartPage).cart_total).to eql total
end

And(/^I complete the adoption with:$/) do |table|
  # table is a table.hashes.keys # => [:name, :address, :email, :pay_type]
  # data = table.hashes.first
  # on(CheckOutPage) do |page|
  #     page.name = data['name']
  #     page.address = data['address']
  #     page.email = data['email']
  #     page.pay_type = data['pay_type']
  #     page.place_order
  on(CheckOutPage).checkout(table.hashes.first)
  end


And(/^I complete the adoption using a credit card$/) do
  on(CheckOutPage).checkout('pay_type' => 'Credit card')
end

And(/^I complete the adoption$/) do
  on(CheckOutPage).checkout
end

When(/^I complete the adoption of a puppy$/) do
  on(HomePage).select_puppy
  on(DetailsPage).add_to_cart
  on(ShoppingCartPage).proceed_to_checkout
  on(CheckOutPage).checkout
end

When(/^I Checkout leaving the name field blank$/) do
  on(HomePage).select_puppy
  on(DetailsPage).add_to_cart
  on(ShoppingCartPage).proceed_to_checkout
  on(CheckOutPage).checkout('name' => '')
end

Then(/^I should see the error message "([^"]*)"$/) do|msg|
  expect(@current_page).to have_error_message msg
end