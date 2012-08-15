$:.unshift File.dirname(__FILE__)

require 'optify/client'

module Optify
  def self.new(token)
    Optify::Client.new(token)
  end
end
