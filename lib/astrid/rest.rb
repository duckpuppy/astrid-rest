require 'json'
require 'yaml'
require 'restclient'
require "astrid/rest/version"

module Astrid
  module Rest
    GLOBAL_CONFIG = '/etc/astridrc'
    CONFIG_FILE = File.expand_path('~/.astridrc')

    class << self
      attr_accessor :user_hash
      attr_accessor :config
    end

    def self.sign_in
    end

    def self.read_config
      config = YAML.load_file(GLOBAL_CONFIG) if File.exist?(GLOBAL_CONFIG)
      config.merge!(YAML.load_file(CONFIG_FILE)) if File.exist?(CONFIG_FILE)
    end
  end
end
