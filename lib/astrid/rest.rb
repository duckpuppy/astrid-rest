require 'json'
require 'yaml'
require 'restclient'
require "astrid/rest/version"

module Astrid
  module Rest
    class << self
      attr_accessor :user_hash
    end

    def self.sign_in
    end

    def self.read_config
      @@config = YAML.load_file(File.expand_path('~/.astridrc'))
    end
  end
end
