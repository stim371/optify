require 'httparty'

module Optify
  class Client
    include HTTParty
     base_uri 'https://api.optify.net'
     format :json

     def initialize(access_token)
       self.class.default_params :access_token => access_token
     end

     def all_sites(options={})
       site_path = "/v1/sites.json"
       self.class.get(site_path, :query => clean(options)).parsed_response
     end

     def site(site_id,options={})
       site_path = "/v1/sites/#{site_id.to_s}.json"
       self.class.get(site_path, :query => clean(options)).parsed_response
     end

     def all_visitors(site_id,options={})
       site_path = "/v1/sites/#{site_id.to_s}/visitors.json"
       self.class.get(site_path, :query => clean(options)).parsed_response
     end

     def visitor(site_id,visitor_id,options = {})
       site_path = "/v1/sites/#{site_id.to_s}/visitors/#{visitor_id.to_s}.json"
       self.class.get(site_path, :query => clean(options)).parsed_response
     end

     def who_am_i
       whois_path = "/whoami"
       self.class.get(whois_path, :format => 'text/plain').parsed_response.chomp
     end

     private

     def clean(opts)
       opts.update(opts) { |key,val| val.is_a?(Date) ? val.strftime('%Y-%m-%d %H:%M:%S') : val.to_s }
     end
  end
end
