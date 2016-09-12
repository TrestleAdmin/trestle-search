module Trestle
  module Search
    class Engine < ::Rails::Engine
      config.assets.precompile << "trestle/search.css" << "trestle/search.js"

      config.before_initialize do
        Trestle::Resource.extend(Trestle::Search::Resource)
        Trestle::Resource::Builder.send(:include, Trestle::Search::Builder)
        Trestle::Resource::Controller.send(:prepend, Trestle::Search::Controller)
      end
    end
  end
end
