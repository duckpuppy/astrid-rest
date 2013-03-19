require 'spec_helper'

describe Astrid::Rest do
  it "must be defined" do
    Astrid::Rest::VERSION.should_not be_nil
  end
end
