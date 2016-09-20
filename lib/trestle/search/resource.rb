module Trestle
  module Search
    module Resource
      attr_writer :search

      def search(query, params={})
        @search.call(query, params)
      end

      def searchable?
        @search
      end
    end
  end
end
