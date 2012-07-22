require 'httparty'

class Optify
  include HTTParty
  base_uri 'https://api.optify.net'
  format :json

  @@date_format = '%Y-%m-%d %H:%m:%S'
  
  def initialize(access_token)
    self.class.default_params :access_token => access_token
  end
  
  def sites(options={})
    site_path = "/v1/sites.json"
    self.class.get(site_path, :query => options).parsed_response
  end
  
  def site_by_id(id,options={})
    site_path = "/v1/sites.json/#{id.to_s}"
    self.class.get(site_path, :query => options).parsed_response
  end

  def visitors_by_site_id(site_id,options={})
    options.keys.each do |key|
      if options[key].kind_of? Date
        options[key] = options[key].strftime(@@date_format)
      end
    end

    path = "/v1/sites/#{site_id.to_s}/visitors.json";
    self.class.get(path, :query => options).parsed_response
  end

  def visitor_by_id(site_id,visitor_id,options = {})
    options.keys.each do |key|
      if options[key].kind_of? Date
        options[key] = options[key].strftime(@@date_format)
      end
    end

    path = "/v1/sites/#{site_id.to_s}/visitors/#{visitor_id.to_s}.json"
    self.class.get(path, :query => options).parsed_response
  end
  
  def who_am_i
    whois_path = "/whoami"
    self.class.get(whois_path, :format => 'text/plain').parsed_response.chomp
  end
  
end
