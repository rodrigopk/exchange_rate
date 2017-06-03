require 'open-uri'
require 'nokogiri'

module ExchangeRate

  CURRENCIES = ["USD", "JPY", "AUD", "NZD", "ZAR", "PLN", "CZK", 
                "RON", "BGN", "TRY", "HUF", "RUB", "HRK", "ILS", 
                "CAD", "BRL", "KRW", "IDR", "PHP", "SGD", "HKD", 
                "CNY", "MYR", "THB", "INR", "NOK", "DKK", "SEK", 
                "CHF", "GBP", "MXN"]
  @@ecb_url = "https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"
  @@cache_uri = Rails.public_path.to_s+"/rates.xml"
  @@cache = nil

  def self.set_cache_uri(path)
    @@cache_uri = path   
    update_cache
  end

  def self.cache_uri
    @@cache_uri  
  end

  def self.set_cache(cache)
    @@cache = cache
  end

  def self.cache
    @@cache
  end

  def self.set_url(url)
    @@ecb_url = url    
  end

  def self.url
    @@ecb_url
  end

  def self.fetch_data
    unless File.exist?(cache_uri)
      self.save_data(cache_uri)
    end
      Nokogiri::XML(File.open(cache_uri).read)
  end

  def self.update_cache
    set_cache(Nokogiri::XML(File.open(cache_uri).read))
  end

  def self.save_data(path)
    File.open(path, "w") do |file|
      ecb_data = open(url);
      ecb_data.each_line do |line| 
        file.puts line
      end
    end
    update_cache
  end

  def self.at(time,from,to)
    raise 'Currency not found' unless available?(from) && available?(to)
    return 1 if from == to

    timestamp = time.to_s
    from_value = rate_for_currency(timestamp,from)
    to_value = rate_for_currency(timestamp,to)
    to_value/from_value
  end

  def self.rate_for_currency(timestamp,currency)
    cache
      .xpath("gesmes:Envelope/xmlns:Cube/xmlns:Cube[@time = '#{timestamp}']/xmlns:Cube[@currency = '#{currency}']/@rate")
      .first.value.to_f
  end

  def self.available?(currency)
    CURRENCIES.include?(currency)
  end

  set_cache(fetch_data)
end