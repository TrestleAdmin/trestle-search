module Trestle
  module Search
    module Resource
      attr_writer :search
      
      def search(query)
        @search.call(query)
      end

      def searchable?
        @search
      end
    end
  end
end
