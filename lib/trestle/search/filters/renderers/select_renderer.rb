module Trestle
  module Search
    class Filters
      class SelectRenderer < Renderer
        def render
          builder.select(name, choices, options, data: { allow_clear: true, placeholder: "" })
        end

        def choices
          filter.options.fetch(:choices)
        end

      protected
        def options
          {
            selected: value,
            label: label,
            include_blank: true
          }
        end
      end
    end
  end
end
