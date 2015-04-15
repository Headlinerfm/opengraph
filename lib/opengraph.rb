require 'hashie'
require 'nokogiri'
require 'restclient'
require 'opengraph/version'
require 'opengraph/types'
require 'opengraph/parser'
require 'opengraph/object'

module OpenGraph
  # Fetch Open Graph data from the specified URI. Makes an
  # HTTP GET request and returns an OpenGraph::Object if there
  # is data to be found or <tt>false</tt> if there isn't.
  #
  # Pass <tt>false</tt> for the second argument if you want to
  # see invalid (i.e. missing a required attribute) data.
  def self.fetch(uri, strict = true)
    parse(RestClient.get(uri).body, strict)
  rescue RestClient::Exception, SocketError
    false
  end
  
  def self.parse(html, strict = true)
    Parser.new(html, strict).process
  end

  private

  attr_accessor :uri, :strict

end
