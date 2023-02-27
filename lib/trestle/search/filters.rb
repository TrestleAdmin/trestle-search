module Trestle
  module Search
    class Filters
      require_relative "filters/block"
      require_relative "filters/definition"
      require_relative "filters/filter"
      require_relative "filters/renderer"

      include Enumerable

      def initialize(definition, context)
        @definition = definition
        @filters = @definition.evaluate(context)
      end

      def each(&block)
        @filters.each(&block)
      end

      def scope(collection, params)
        active(params).each do |filter, value|
          collection = filter.scope(collection, value, params) || collection
        end

        collection
      end

      def active(params)
        filter_params = params[:f]

        Enumerator.new do |yielder|
          each do |name, filter|
            if value = filter_params[name].presence
              yielder << [filter, value]
            end
          end if filter_params.present?
        end
      end
    end
  end
end
