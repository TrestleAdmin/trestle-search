module Trestle
  module Search
    module SunspotAdapter
      def merge_scopes(scope, other)
        other
      end

      def count(search)
        search.execute.hits.total_count
      end

      def sort(search, field, order)
        search.build do
          order_by(field, order)
        end
      end

      def paginate(search, params)
        search.build do
          paginate(page: params[:page], per_page: 25)
        end
      end

      def finalize_collection(search)
        search.execute.results
      end
    end
  end
end
