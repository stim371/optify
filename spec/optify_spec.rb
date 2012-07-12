require 'spec_helper'

describe Optify do
  
  context "setup" do
    it "should have the base url set to the Optify API endpoint" do
      Optify.base_uri.should eq "https://api.optify.net/v1"
    end
  end
  
  describe "#sites", :vcr => { :cassette_name => "optify_sites" } do
    
    subject { Optify.new('wmjf73ott6f33unj2ztlttor') }
    
    it "should get all site information" do
      a = subject.sites
      puts a
      a.should_not be_nil
    end
  end
  
end
