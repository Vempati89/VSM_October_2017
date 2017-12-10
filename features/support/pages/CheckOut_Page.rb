class CheckOutPage
  require_relative 'Error_panel'
  include PageObject
  include DataMagic
  include ErrorPanel

  # DEFAULT_DATA = {
  #     'name' => 'VSM',
  # 'address' => '508 Sand Broad CT',
  #     'email' => 'SVM@testmail.com',
  #     'pay_type' => 'Check'
  #
  # # 'name' => Faker::Name.name,
  # #     'address' => Faker::Address.street_address,
  # #     'email' => Faker::Internet.email,
  # #     'pay_type' => 'Check'
  # }

  text_field(:name, :id => 'order_name')
  textarea(:address, :id=>'order_address')
  text_field(:email, id: 'order_email')
  select_list(:pay_type, id: 'order_pay_type')
  button(:place_order, value: 'Place Order')


  def checkout (data = {})
    # data = DEFAULT_DATA.merge(data)
    # self.name = data['name']
    # self.address = data['address']
    # self.email = data['email']
    # self.pay_type = data['pay_type']
    populate_page_with data_for(:checkout_page, data)
    place_order
  end

end

# without PageObject
# class CheckoutPage
#   def initialize (browser)
#     @browser = browser
#   end
#
#   def name=(name)
#     @browser.text_field(:id => 'order_name').set (name)
#   end
#   def address=(address)
#     @browser.textarea(:id => 'order_address').set (address)
#   end
#   def email=(email)
#     @browser.text_field(:id => 'order_email').set (email)
#   end
#   def pay_type=(pay_type)
#     @browser.select_list(:id => 'order_pay_type').select (pay_type)
#   end
# def place_order
#   @browser.button(:value => 'Place Order').click
# end
# end

