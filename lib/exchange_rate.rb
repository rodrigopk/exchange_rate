require 'open-uri'
require 'nokogiri'

module ExchangeRate
  
  ECB_URL = "https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"
  @@ECB_DATA = nil

  def ExchangeRate.at(timestamp,from,to)
    from_value = ExchangeRate.rate_for_currency(timestamp,from)
    to_value = ExchangeRate.rate_for_currency(timestamp,to)
    to_value/from_value
  end


  def ExchangeRate.read_exchange_data    
    @@ECB_DATA ||= Nokogiri::XML(open(ECB_URL).read).remove_namespaces!
  end

  def ExchangeRate.rate_for_currency(timestamp,currency)
  	ExchangeRate
  		.read_exchange_data
  		.xpath("//Cube/Cube[@time = '#{timestamp}']/Cube[@currency = '#{currency}']/@rate")
  		.first.value.to_f
  end

end