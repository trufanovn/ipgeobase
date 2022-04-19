# frozen_string_literal: true

require_relative 'test_helper'

class TestIpgeobase < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_equal_mock
    xlm_body = File.read('./test/fixtures/xlm_body.xml')
    stub_request(:get, "http://ip-api.com/xlm/8.8.8.8").to_return(status: 200, body: xlm_body)
    data = Ipgeobase.lookup('8.8.8.8')
    assert_equal data.lon, "-77.5"
  end

  def test_equal_city
    WebMock.allow_net_connect!
    ip_meta = Ipgeobase.lookup('8.8.8.8')
    assert_equal ip_meta.city, 'Ashburn'
  end
end