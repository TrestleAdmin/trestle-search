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
    end
  end
end
