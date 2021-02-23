require_relative "./date_renderer"

module Trestle
  module Search
    class Filters
      class DateRangeRenderer < DateRenderer
        def data
          { picker: true, allow_clear: true, mode: "range" }.merge(super)
        end

      protected
        def options
          super.merge(data: data)
        end
      end
    end
  end
end
