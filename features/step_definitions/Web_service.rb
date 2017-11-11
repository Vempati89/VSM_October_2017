When(/^I ask the service for the supported operations$/) do
  @operations = using(ZipCodeInformationService).operations
end

Then(/^"([^"]*)" should be supported$/) do |operation|
  expect(@operations).to include operation.to_sym
end

When(/^I ask for zip code information for "([^"]*)"$/) do |zip_code|
  using(ZipCodeInformationService).get_info_by_zip('USZip' => zip_code)
end


Then(/^I should see the following$/) do |table|
  # table is a table.hashes.keys # => [:City, :State, :Area_code, :Time_Zone]
  expected = table.hashes.first
  using(ZipCodeInformationService) do |service|
   expect(service.response(:city)).to eql expected['city']
   expect(service.response(:state)).to eql expected['state']
   expect(service.response(:area_code)).to eql expected['area_code']
   expect(service.response(:time_zone)).to eql expected['time_zone']
  end
end