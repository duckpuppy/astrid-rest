require 'spec_helper'

describe "::VERSION" do
  it "must be defined" do
    Astrid::Rest::VERSION.should_not be_nil
  end
end


