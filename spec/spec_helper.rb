require 'simplecov'
SimpleCov.start

require 'optify'
require 'vcr'
require 'webmock/rspec'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/optify_cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = false
  c.configure_rspec_metadata!
  c.default_cassette_options = {
    :record => :once
  }
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
end
