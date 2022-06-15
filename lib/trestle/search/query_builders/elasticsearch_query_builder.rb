module Trestle
  module Search
    module ElasticsearchQueryBuilder

      # Default query object to pass to ES queryable objects
      # query is a string that is being searched. empty string or nil
      # will result in all the records in the model being returned
      # If you want fuzzy match send your query string wrapped in  *
      # E.G. "*ist*" will return District, district, Istanbul, istanbul
      def build_string_query(query:)
        if query.present?
          {
            query: {
              query_string: {
                query: query
              }
            }
          }
        else
          {
            query: {
              match_all: {}
            }
          }
        end
      end

      # Feed a valid ES Query object and it will add the sort parameters on
      # NOTE: Sort in ES is only available on ID unless specifically allowed on the index mapping
      # see: https://www.elastic.co/guide/en/elasticsearch/reference/current/text.html#fielddata-mapping-param
      def build_sort_query(query:, params:)
        sort = params[:sort] || :id
        order = params[:order] || :desc

        query.merge({
          sort: [
            sort => {
              order: order
            }
          ]
        })
      end

    end
  end
end

