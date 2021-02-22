module Trestle
  module Search
    module ActiveRecordAdapter
      def filter_column(collection, name, value)
        collection.where(name => value)
      end
    end
  end
end
