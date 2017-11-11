class LoginPage
  include PageObject

  text_field(:user_name, id: 'name')
  text_field(:pwd, id: 'password')
  button(:login, value: 'Login')

  def login_to_admin (user_name='admin', pwd='password' )
    self.user_name = user_name
    self.pwd = pwd
    login
  end
end