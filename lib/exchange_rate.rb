require 'open-uri'
require 'nokogiri'

module ExchangeRate
  
  EXCHANGE_URL = "https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"

  def ExchangeRate.at(time,from,to)
    "#{time},#{from},#{to}"
  end


  def ExchangeRate.get_exchange_data
    xml_content = open(EXCHANGE_URL).read
    puts xml_content    
  end

end
