require_relative "./date_renderer"

module Trestle
  module Search
    class Filters
      class DateRangeRenderer < DateRenderer
      protected
        def defaults
          super.merge({
            data: {
              picker: true,
              allow_clear: true,
              mode: "range"
            }
          })
        end
      end
    end
  end
end
