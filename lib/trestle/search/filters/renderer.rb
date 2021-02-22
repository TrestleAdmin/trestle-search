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

        def label
          filter.options[:label]
        end

      protected
        def options
          {
            value: value,
            label: label
          }
        end
      end
    end
  end
end

Dir.glob("#{__dir__}/renderers/*.rb") { |f| require_relative f }
