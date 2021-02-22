module Trestle
  module Search
    class Filters
      class DateRangeRenderer < DateRenderer
      protected
        def options
          super.merge(data: { picker: true, allow_clear: true, mode: "range" })
        end
      end
    end
  end
end
