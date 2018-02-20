module Trestle
  module Search
    module ChewyAdapter
      def finalize_collection(query)
        query.records
      end
    end
  end
end
