require "trestle/search/version"

module Trestle
  module Search
    extend ActiveSupport::Autoload

    autoload :Builder
    autoload :Controller
    autoload :Resource
  end
end

require "trestle/search/engine" if defined?(Rails)
