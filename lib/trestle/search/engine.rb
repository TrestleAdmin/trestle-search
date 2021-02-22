module Trestle
  module Search
    class Engine < ::Rails::Engine
      config.assets.precompile << "trestle/search.js" << "trestle/search.css"

      config.to_prepare do
        Trestle::ResourceController.send(:prepend, Trestle::Search::Controller)
      end

      initializer :extensions do
        Trestle::Resource.send(:include, Trestle::Search::Resource)
        Trestle::Resource::Builder.send(:include, Trestle::Search::Builder)
      end

      initializer :adapter do
        Trestle::Adapters::ActiveRecordAdapter.send(:include, Trestle::Search::ActiveRecordAdapter)

        # The default adapter is composed before these initializers are run so we must extend it manually
        if Trestle.config.default_adapter < Trestle::Adapters::ActiveRecordAdapter
          Trestle.config.default_adapter.send(:include, Trestle::Search::ActiveRecordAdapter)
        end
      end
    end
  end
end
