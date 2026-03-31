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
        filter_params = params[:f] || {}

        Enumerator.new do |yielder|
          each do |name, filter|
            value = filter_params[name].presence || filter.options[:default].presence
            yielder << [filter, value] if value
          end
        end
      end
    end
  end
end
