require 'json'
require 'yaml'
require 'restclient'
require "astrid/rest/version"

# Require the gem files
require File.join(File.dirname(__FILE__), 'rest', 'config')

module Astrid
  module Rest
    API_VERSION = "7"
    API_ROOT = "https://astrid.com/api/#{API_VERSION}/"

    extend self

    def sign_in
    end
  end
end
