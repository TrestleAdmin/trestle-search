module Trestle
  module Search
    module ElasticsearchAdapter
      # if your application uses WillPaginate for ElasticSearch as the default paginator
      # trestle pagination will not be working out of the box with ElasticSearch.
      # There is no clean way to set this as evidenced in
      # https://github.com/elastic/elasticsearch-rails/blob/d12d812c3f52ac484cf73805ef41986dd95ba5a0/elasticsearch-model/lib/elasticsearch/model.rb
      # This re-run resets the pagination setter when searching with trestle
      case
      when defined?(::Kaminari)
        Elasticsearch::Model::Response::Response.__send__ :include, Elasticsearch::Model::Response::Pagination::Kaminari
      when defined?(::WillPaginate)
        Elasticsearch::Model::Response::Response.__send__ :include, Elasticsearch::Model::Response::Pagination::WillPaginate
      end

      # Pulls activerecord objects from ES query
      def finalize_collection(query)
        query.records
      end

      # Pulls number of records found in query
      def count(collection)
        collection.count
      end

      # Override the sort method which only works with activerecord
      # Sort happens in the admin model and the Elasticsearch::Querybuilder
      def sort(collection, field, order)
        collection
      end

    end
  end
end
