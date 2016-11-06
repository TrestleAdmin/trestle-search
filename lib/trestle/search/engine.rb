module Trestle
  module Search
    class Engine < ::Rails::Engine
      config.assets.precompile << "trestle/search.css" << "trestle/search.js"

      initializer :extensions do
        Trestle::Resource.singleton_class.send(:prepend, Trestle::Search::Resource)
        Trestle::Resource::Builder.send(:include, Trestle::Search::Builder)
        Trestle::Resource::Controller.send(:prepend, Trestle::Search::Controller)
      end
    end
  end
end
