module Astrid
  module Rest
    module Config
      extend self
      GLOBAL_CONFIG = '/etc/astridrc'
      LOCAL_CONFIG = ENV['ASTRID_CONFIG_FILE'] || File.join(ENV['HOME'], '.astridrc')

      attr_reader :config

      def defaults
        {
        }
      end

      def load_config
        global = File.exist?(GLOBAL_CONFIG) ? YAML.load_file(GLOBAL_CONFIG) : {}
        local = File.exist?(LOCAL_CONFIG) ? YAML.load_file(LOCAL_CONFIG) : {}

        @config = defaults.merge(global).merge(local)
      end
    end
  end
end
