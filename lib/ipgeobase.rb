# frozen_string_literal: true

require_relative "ipgeobase/version"

require "happymapper"
require "addressable/template"
require "net/http"

module Ipgeobase
  class Post
    include HappyMapper
    tag "query"
    element :city, String, tag: "city"
    element :country, String, tag: "country"
    element :countryCode, String, tag: "countryCode"
    element :lat, String, tag: "lat"
    element :lon, String, tag: "lon"
  end

  class Error < StandardError
  end

  def self.lookup(ip)
    template = Addressable::Template.new("http://{host}{/type}/{ip}")
    uri = template.expand({ "host" => "ip-api.com", "type" => "xml", "ip" => ip })
    get_data = Net::HTTP.get_response(uri)
    Post.parse(get_data.body)
  end
end
