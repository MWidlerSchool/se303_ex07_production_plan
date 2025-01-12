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

    def test_negative_demand
        @asia.demand = -1
        assert_equal(-26, @asia.shortfall)
        assert_equal(-10, @asia.profit)
    end

    def test_empty_string_demand
        @asia.demand = ""
        exception = assert_raises(NoMethodError) {@asia.shortfall}
    end

    def test_string_for_producers
        bad_data = {
            name: 'Asia',
            producers: "This is not an okay place for a string",
            demand: 30,
            price: 20
        }
        assert_raises(NoMethodError) {Province.new(bad_data)}
    end
end
