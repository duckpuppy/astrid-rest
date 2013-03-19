require 'spec_helper'

describe "Astrid::Rest" do
  describe "::API_VERSION" do
    it "should be defined" do
      Astrid::Rest::API_VERSION.should_not be_nil
    end

    it "should be 7" do
      Astrid::Rest::API_VERSION.should eq "7"
    end
  end

  describe "::API_ROOT" do
    it "should be defined" do
      Astrid::Rest::API_ROOT.should_not be_nil
    end

    it "should be valid" do
      Astrid::Rest::API_ROOT.should eq "https://astrid.com/api/7/"
    end
  end
end
