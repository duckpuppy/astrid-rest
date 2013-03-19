require 'json'
require 'yaml'
require 'restclient'
require "astrid/rest/version"

require File.join(File.dirname(__FILE__), 'rest', 'config')

module Astrid
  module Rest
    extend self

    attr_accessor :user_hash

    def self.sign_in
    end
  end
end
