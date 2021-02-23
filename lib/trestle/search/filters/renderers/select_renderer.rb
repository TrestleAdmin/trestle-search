module Trestle
  module Search
    class Filters
      class SelectRenderer < Renderer
        def render
          builder.select(name, choices, options, html_options)
        end

        def choices
          filter.options.fetch(:choices)
        end

      protected
        def defaults
          Trestle::Options.new({
            selected: value,
            include_blank: ""
          })
        end

        def options
          defaults.merge(filter.options.slice(:label, :help))
        end

        def default_html_options
          Trestle::Options.new({
            data: {
              allow_clear: true,
              placeholder: ""
            }
          })
        end

        def html_options
          default_html_options.merge(filter.options.slice(:class, :data))
        end
      end
    end
  end
end
