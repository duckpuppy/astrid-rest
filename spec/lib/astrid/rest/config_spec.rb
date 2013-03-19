require 'spec_helper'

describe Astrid::Rest::Config do
  describe "#load_config" do
    describe "global config" do
      context "missing" do
        include FakeFS::SpecHelpers
        specify { expect {Astrid::Rest::Config.load_config}.to_not raise_error }
      end

      context "present" do
        include FakeFS::SpecHelpers

        before :each do
          # We have to do this for each rather than all so that FakeFS is used
          FileUtils.mkdir("/etc")
          global_hash = { "secret" => "global_secret", "api_key" => "global_key" }
          @global = File.new(Astrid::Rest::Config::GLOBAL_CONFIG, 'w+')
          @global.write(global_hash.to_yaml)

          @config = Astrid::Rest::Config.load_config
        end

        subject { @config }
        it { should_not be_nil }
        it { should_not be_empty }
        specify { @config["secret"].should eq "global_secret" }
        specify { @config["api_key"].should eq "global_key" }
      end
    end
    describe "local config" do
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
