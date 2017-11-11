class HomePage
  require_relative 'side_menu_panel'
  include PageObject
  include SideMenuPanel

page_url 'http://puppies.herokuapp.com'
  # button(:value => 'View Details' , :index => 0)
  # button(:value => 'View Details' , :index => 1)
  # below is the method for above two steps

  divs(:name, :class => 'name')
  buttons(:view_detail, :value => 'View Details')

  # def select_puppy_number (num)
  #   button_element(:value => 'View Details' , :index => num - 1).click
  # end

  def select_puppy(name = 'Maggie Mae')
    index = index_for(name)
     # view_detail_elements[index].click
    button_element(:value => 'View Details' , :index => index).click
  end

  private
  def index_for(name)
    name_elements.find_index {|the_div| the_div.text == name}
  end

end