require 'test_helper'

class ExchangeRate::Test < ActiveSupport::TestCase  

  def test_at_returns_value    
    assert_equal "#{Date.today},GBP,USD", ExchangeRate.at(Date.today,'GBP','USD')
  end

end
