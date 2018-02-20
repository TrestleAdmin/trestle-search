require "trestle/search/version"

require "trestle"

module Trestle
  module Search
    extend ActiveSupport::Autoload

    autoload :Builder
    autoload :Controller
    autoload :Resource

    autoload_under "adapters" do
      autoload :ChewyAdapter
      autoload :SunspotAdapter
    end
  end
end

require "trestle/search/engine" if defined?(Rails)
