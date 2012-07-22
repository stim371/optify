require 'spec_helper'

describe Optify do
  
  subject { Optify.new('wmjf73ott6f33unj2ztlttor') }
  
  context "getting started" do

    describe "#initialize" do
      it "should raise an error if no token given" do
        lambda { Optify.new }.should raise_error
      end
    end

    describe "setup" do
      it "should have the base url set to the Optify API endpoint" do
        Optify.base_uri.should eq "https://api.optify.net"
      end
    end    
  end
  
  describe "#sites", :vcr => { :cassette_name => "optify_sites" } do

    before(:each) { @sites = subject.sites }

    it "should return some info" do
      @sites.should_not be_nil
    end
    
    it "should have site details" do
      @sites[0]["name"].should eq "NetVM (Germany)"
    end
  end
  
  describe "#site", :vcr => { :cassette_name => "optify_site" } do
    
    before(:each) { @site = subject.site_by_id("4854OOO0") }
    
    it "should only return a single hash" do
      @site.class.should eq Hash
    end
    
    it "should get site info for a specific site" do
      @site["name"].should eq "NetVM (Germany)"
    end

  end
  
  describe "#visitors", :vcr => { :cassette_name => "site_visitors" } do
    # need to get updated api content that actually has visitors
    before(:each) { @visitors = subject.visitors_by_site_id("4854OOO0") }

    it "should provide information on visitors to the site" do
      @visitors.should_not be_nil
    end
  end
  
  # describe "#visitor", :vcr => { :cassette_name => "site_visitor"  do
  #   
  #   before(:each) { @visitor = subject.visitor_by_id("4854OOO0",) }
  #   
  #   it "should only return a single hash" do
  #     @visitor.class.should be Hash
  #   end
  #   
  #   it "should provide information on a specific visitor to a site"
  # end
  
end
