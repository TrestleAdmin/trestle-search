module Trestle
  module Search
    module Resource
      extend ActiveSupport::Concern

      included do
        # Include custom #collection method on Resource instance
        prepend CollectionMethods

        # Include search and filter methods normally
        include SearchMethods
        include FilterMethods

        # Include custom #collection method on Resource class
        singleton_class.send(:prepend, CollectionMethods)

        # Adapter method for default filter blocks.
        # See Trestle::Search::ActiveRecordAdapter for default implementation
        adapter_method :filter_column
      end

      module SearchMethods
        def search(params={})
          if searchable?
            query = params[:q].presence
            adapter.search(query, params)
          end
        end
      end

      module FilterMethods
        def filter(collection, params={})
          if filterable? && params[:f].present?
            filters.scope(collection, params)
          else
            collection
          end
        end

        def filters
          @filters ||= Filters.new(self.class.filters, adapter)
        end

        def filterable?
          filters.any?
        end
      end

      module CollectionMethods
        def collection(params={})
          collection = search(params) || super
          collection = filter(collection, params)
          collection
        end
      end

      module ClassMethods
        def searchable?
          adapter.respond_to?(:search)
        end

        def filters
          @filters ||= Filters::Definition.new
        end
      end
    end
  end
end
