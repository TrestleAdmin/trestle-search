module Trestle
  module Search
    class Filters
      class Renderer
        attr_reader :builder, :filter, :params

        delegate :name, to: :filter

        def initialize(builder, filter, params)
          @builder, @filter, @params = builder, filter, params
        end

        def render
          raise NotImplementedError
        end

        def value
          params[name] || ""
        end

      protected
        def defaults
          Trestle::Options.new(value: value)
        end

        def options
          defaults.merge(filter.options.slice(:label, :class, :help, :data))
        end
      end
    end
  end
end

Dir.glob("#{__dir__}/renderers/*.rb") { |f| require_relative f }
