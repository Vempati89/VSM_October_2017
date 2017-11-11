class ZipCodeInformationService
  include SoapObject
  wsdl 'http://www.webservicex.net/uszip.asmx?WSDL'

  def response (key)
    message[key]
  end

  # def city
  #   message[:city]
  # end
  # def state
  #   message[:state]
  # end
  # def area_code
  #   message[:area_code]
  # end
  # def time_zone
  #   message[:time_zone]
  # end

  private
  def message
    body[:get_info_by_zip_response][:get_info_by_zip_result][:new_data_set][:table]
  end

end