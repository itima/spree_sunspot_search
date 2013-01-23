require 'spree_core'
require 'spree/search/base'
require 'sunspot_rails'
require 'spree/search/sunspot'
require 'spree/search/configuration'
require 'spree_sunspot_search_hooks'

module SpreeSunspotSearch
  class Engine < Rails::Engine
    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      return unless Spree::Search.configuration
      
      if Spree::Config.instance
        Spree::Config.searcher_class = Spree::Search::Sunspot
      end
      
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end
    config.to_prepare &method(:activate).to_proc
  end
end
