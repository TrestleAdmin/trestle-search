module Trestle
  module Search
    module ChewyAdapter
      def finalize_collection(query)
        query.records
      end

      def count(collection)
        collection.count
      end
    end
  end
end
