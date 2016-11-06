module Trestle
  module Search
    module Resource
      attr_writer :search

      def collection(params)
        if searchable?
          @search.call(params[:q] || "", params)
        else
          super
        end
      end

      def searchable?
        @search
      end
    end
  end
end
