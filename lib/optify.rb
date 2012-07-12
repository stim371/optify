require 'httparty'

class Optify
  include HTTParty
  base_uri 'https://api.optify.net/v1'
  
  def initialize(access_token)
    self.class.default_params :access_token => access_token
  end
  
  def sites(options={})
    site_path = "/sites"
    site_path << ".json" if options[:format] == "json"
    
    self.class.get(site_path, :query => options).body
  end
  
  def site_by_id(id,options={})
    site_path = "/sites/#{id.to_s}"
    site_path << ".json" if options[:format] == "json"
    
    self.class.get(site_path, :query => options).body
  end
  
  def who_am_i
    whois_path = "https://api.optify.net/whoami"
    self.class.get(whois_path).body.chomp
  end
  
end
