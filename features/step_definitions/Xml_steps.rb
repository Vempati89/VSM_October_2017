When(/^I open my shows xml$/) do
  the_file = File.open('shows.xml')
  @xml = Nokogiri::XML(the_file)
  the_file.close
end

Then(/^I should see (\d+) sitcoms$/) do |num|
  expect(@xml.xpath('//sitcom').length).to eql num.to_i
end

And(/^I should see (\d+) drama$/) do |num_2|
  expect(@xml.xpath('//drama').length).to eql num_2.to_i
end

Given(/^I have the list$/) do |table|
  # table is a table.hashes.keys # => [:name, :phone]
  builder = Builder::XmlMarkup.new
  @xml = builder.contacts do |contacts|
    table.hashes.each do |row|
      contacts.contact do |contact|
        contact.name row['name']
        contact.phone row['phone']
      end
    end
  end
  end

When(/^I select "([^"]*)"$/) do |name|
  doc = Nokogiri::XML(@xml)
  contacts = doc.xpath('//contact')
  @node = contacts.find {|row| row.content.include? name}
end

Then(/^I should see the phone number "([^"]*)"$/) do |number|
  expect(@node.at_xpath('.//phone').content).to eql number
end