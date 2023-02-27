module Trestle
  module Search
    class Filters
      class Renderer
        attr_reader :builder, :filter, :params

        delegate :name, to: :filter
        delegate :concat, :content_tag, to: :template

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
          defaults.merge(filter.options.slice(:label, :placeholder, :class, :help, :data))
        end

        def template
          builder.instance_variable_get("@template")
        end
      end
    end
  end
end

Dir.glob("#{__dir__}/renderers/*.rb") { |f| require_relative f }
