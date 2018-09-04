module Trestle
  module Search
    module Resource
      extend ActiveSupport::Concern

      included do
        # Include custom #collection method on Resource instance
        prepend Collection

        # Include custom #collection method on Resource class
        singleton_class.send(:prepend, Collection)
      end

      module Collection
        def collection(params)
          if searchable?
            adapter.search(params[:q].presence, params)
          else
            adapter.collection(params)
          end
        end
      end

      module ClassMethods
        def searchable?
          adapter.respond_to?(:search)
        end
      end
    end
  end
end
