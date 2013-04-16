require 'spec_helper'

# TODO: There's some really bad redundancy here - make helpers for creating
# config files and testing hash contents
describe Astrid::Rest::Config do
  describe "::GLOBAL_CONFIG" do
    it "should be defined" do
      Astrid::Rest::Config::GLOBAL_CONFIG.should_not be_nil
    end

    it "should be valid" do
      Astrid::Rest::Config::GLOBAL_CONFIG.should eq "/etc/astridrc"
    end
  end
  describe "::LOCAL_CONFIG" do
    it "should be defined" do
      Astrid::Rest::Config::LOCAL_CONFIG.should_not be_nil
    end
  end

  describe "#load_config" do
    describe "global config" do
      context "missing" do
        include FakeFS::SpecHelpers
        specify { expect {Astrid::Rest::Config.load_config}.to_not raise_error }
      end

      context "present" do
        include FakeFS::SpecHelpers
        let(:expected) { { "secret" => "global_secret", "api_key" => "global_key" } }

        before :each do
          # We have to do this for each rather than all so that FakeFS is used
          FileUtils.mkdir("/etc")
          config_hash = { "secret" => "global_secret", "api_key" => "global_key" }
          @global = File.new(Astrid::Rest::Config::GLOBAL_CONFIG, 'w+')
          @global.write(config_hash.to_yaml)

          @config = Astrid::Rest::Config.load_config
        end

        subject { @config }
        it { should_not be_nil }
        it { should_not be_empty }
        it { should eq expected }
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
        include FakeFS::SpecHelpers

        before :each do
          # We have to do this for each rather than all so that FakeFS is used
          FileUtils.makedirs(File.dirname(Astrid::Rest::Config::LOCAL_CONFIG))
          config_hash = { "secret" => "local_secret", "user" => "local_user" }
          @local = File.new(Astrid::Rest::Config::LOCAL_CONFIG, 'w+')
          @local.write(config_hash.to_yaml)

          @config = Astrid::Rest::Config.load_config
        end
        context "with global" do
          let(:expected) { { "secret" => "local_secret", "api_key" => "global_key", "user" => "local_user" } }
          before :each do
            # We have to do this for each rather than all so that FakeFS is used
            FileUtils.mkdir("/etc")
            config_hash = { "secret" => "global_secret", "api_key" => "global_key" }
            @global = File.new(Astrid::Rest::Config::GLOBAL_CONFIG, 'w+')
            @global.write(config_hash.to_yaml)

            @config = Astrid::Rest::Config.load_config
          end

          subject { @config }
          it { should_not be_nil }
          it { should_not be_empty }
          it { should eq expected }
        end

        context "without global" do
          let (:expected) { { "secret" => "local_secret", "user" => "local_user" } }

          subject { @config }
          it { should_not be_nil }
          it { should_not be_empty }
          it { should eq expected }
        end
      end
    end
  end
end
