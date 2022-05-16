gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/producer'
require_relative '../lib/province'
require_relative '../lib/data'

class ProducerTest < Minitest::Test

    def setup
      @asia = Province.new(sample_province_data)
    end

    def test_zero_demand
        @asia.demand = 0
        assert_equal(-25, @asia.shortfall)
        assert_equal(0, @asia.profit)
    end
end
