module Trestle
  module Search
    class Filters
      class DateRenderer < Renderer
        def render
          builder.date_field(name, options)
        end
      end
    end
  end
end
