module SpreeSunspotSearch
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../templates/', __FILE__)

      def copy_public
        directory "public"
      end

      def copy_initializer_file
        copy_file 'spree_sunspot_search.rb', "config/initializers/spree_sunspot_search.rb"
      end
    end
  end
end
