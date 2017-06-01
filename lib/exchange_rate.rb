require 'open-uri'
require 'nokogiri'

module ExchangeRate
  
  EXCHANGE_URL = "https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"

  def ExchangeRate.at(time,from,to)
    "#{time},#{from},#{to}"
  end


  def ExchangeRate.read_exchange_data    
    Nokogiri::XML(open(EXCHANGE_URL).read).remove_namespaces!
  end

  def ExchangeRate.rate_for_currency(timestamp,currency)
  	ExchangeRate
  		.read_exchange_data
  		.xpath("//Cube/Cube[@time = '#{timestamp}']/Cube[@currency = '#{currency}']/@rate")
  end

end
