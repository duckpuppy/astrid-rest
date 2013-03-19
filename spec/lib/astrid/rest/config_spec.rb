require 'spec_helper'

describe "Astrid::Rest::Config" do
  subject { Astrid::Rest::Config }
  describe ".load_config" do
    context "global config" do
      context "missing" do
        include FakeFS::SpecHelpers
        File.rm(Astrid::Rest::Config::GLOBAL_CONFIG) if File.exist? Astrid::Rest::Config::GLOBAL_CONFIG
        it "should not raise an error" do
          expect {Astrid::Rest::Config.load_config}.to_not raise_error
        end
      end
      context "present" do
        include FakeFS::SpecHelpers
        # TODO: Create a global config file in the Fake FS
      end
    end
    context "local config" do
      context "missing" do
        context "with global" do
        end

        context "without global" do
        end
      end
      context "present" do
        context "with global" do
        end

        context "without global" do
        end
      end
    end
  end
end
