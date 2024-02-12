require_relative "./date_renderer"

module Trestle
  module Search
    class Filters
      class DateRangeRenderer < DateRenderer
      protected
        def defaults
          super.merge({ data: { mode: "range" } })
        end
      end
    end
  end
end
