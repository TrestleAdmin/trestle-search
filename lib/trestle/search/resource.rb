module Trestle
  module Search
    module Resource
      attr_writer :search

      def initialize_collection(params)
        query_param = params[:q]

        if searchable? && query_param.present?
          search(query_param, params)
        else
          super(params)
        end
      end

      def search(query, params)
        instance_exec(query, params, &@search)
      end

      def searchable?
        @search
      end
    end
  end
end
