module Trestle
  module Search
    class Filters
      class SelectRenderer < Renderer
        def render
          builder.select(name, choices, options, data: data)
        end

        def choices
          filter.options.fetch(:choices)
        end

        def data
          { allow_clear: true, placeholder: "" }.merge(super)
        end

      protected
        def options
          {
            selected: value,
            label: label,
            include_blank: ""
          }
        end
      end
    end
  end
end
