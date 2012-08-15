require 'spec_helper'

describe Optify::Client do
  
  subject { Optify.new('wmjf73ott6f33unj2ztlttor') }
  
  context "getting started" do

    describe "#initialize" do
      it "should raise an error if no token given" do
        lambda { Optify.new }.should raise_error
      end
    end

    describe "setup" do
      it "should have the base url set to the Optify API endpoint" do
        Optify::Client.base_uri.should eq "https://api.optify.net"
      end
    end    
  end
  
  describe "#all_sites", :vcr => { :cassette_name => "optify_sites" } do

    let(:sites) { subject.all_sites }

    specify { sites.should_not be_nil }
    
    it "should have site details" do
      sites[0]["name"].should eq "NetVM (Germany)"
    end
  end
  
  describe "#site", :vcr => { :cassette_name => "optify_site" } do
    
    let(:site) { subject.site("4854OOO0") }
    
    it "should only return a single hash" do
      site.class.should eq Hash
    end
    
    it "should get site info for a specific site" do
      site["name"].should eq "NetVM (Germany)"
    end
  end
  
  describe "#all_visitors", :vcr => { :cassette_name => "site_visitors" } do
    # need to get updated api content that actually has visitors
    let(:visitors) { Optify.new("qbkkw3ir3gtg7bdf4rumb69p").all_visitors("UQP1WJ35") }
    
    specify { visitors.should_not be_empty }
  end
  
  describe "#visitor", :vcr => { :cassette_name => "site_visitor" } do
    
    let(:visitor) { Optify.new("qbkkw3ir3gtg7bdf4rumb69p").visitor("UQP1WJ35","3CAD1130-b933-4b48-af79-859b89065c64") }
    
    specify { visitor.should_not be_empty }
    
    it "should only return a single hash" do
      visitor.class.should be Hash
    end
    
    it "should provide information on one user" do
      visitor["visitor_id"].should eq "3CAD1130-b933-4b48-af79-859b89065c64"
      visitor["country"].should eq "US"
      visitor["site_token"].should eq "UQP1WJ35"
      visitor["hidden"].should eq false
    end
  end
  
  describe "#who_am_i", :vcr => { :cassette_name => "specific site visitor" } do
    
    it "should tell me my name" do
      subject.who_am_i.should_not be_nil
    end
  end
end
