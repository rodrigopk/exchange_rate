require 'test_helper'

class ExchangeRate::Test < ActiveSupport::TestCase  

	def setup
		ExchangeRate.set_cache_uri(Dir.pwd+'/test/fixtures/test_data.xml')
		@date = Date.new(2017,6,2)
	end

  def test_data_cached_in_memory_value    
    assert_not ExchangeRate.cache.nil?
  end

  def test_rate_for_currency_return    
    assert_equal 1.2853508731722967, ExchangeRate.at(@date,'GBP','USD')
  end

  def test_at_return    
    assert_equal 1.1217, ExchangeRate.rate_for_currency(@date.to_s,'USD')
  end

end
