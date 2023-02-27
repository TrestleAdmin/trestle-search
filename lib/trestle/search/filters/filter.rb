module Trestle
  module Search
    class Filters
      class Filter
        attr_reader :name, :options, :block

        def initialize(admin, name, options, &block)
          @admin, @name, @options, @block = admin, name, options, block
        end

        def scope(collection, value, params={})
          if @block
            @block.call(collection, value, params)
          else
            @admin.filter_column(collection, name, value)
          end
        end

        def render(builder, filter_params)
          renderer_class.new(builder, self, filter_params || {}).render
        end

      private
        def renderer_class
          if options[:renderer]
            options[:renderer]
          else
            renderer_for(options[:type]) || TextRenderer
          end
        end

        def renderer_for(type)
          case options[:type]
          when :date
            DateRenderer
          when :daterange
            DateRangeRenderer
          when :select
            SelectRenderer
          when :range
            RangeRenderer
          when :text, :string
            TextRenderer
          end
        end
      end
    end
  end
end
