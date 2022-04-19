# frozen_string_literal: true

require_relative "ipgeobase/version"
require_relative "HappyInit"

require "addressable/template"
require "net/http"

module Ipgeobase

  class Error < StandardError
  end

  def self.lookup(ip)
    template = Addressable::Template.new("http://{host}{/type}/{ip}")
    uri = template.expand({ "host" => "ip-api.com", "type" => "xml", "ip" => ip })
    response = Net::HTTP.get_response(uri)
    Post.parse(response.body)
  end
end
