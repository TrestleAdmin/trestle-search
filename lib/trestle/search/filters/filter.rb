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
          filter_params ||= {}
          field_options = {
            value: filter_params[name] || "",
            label: options[:label]
          }

          case options[:type]
          when :date
            builder.date_field name, field_options
          when :select
            builder.select name, options[:choices], field_options.merge(include_blank: true, selected: field_options[:value]), data: { allow_clear: true, placeholder: "" }
          else
            builder.text_field name, field_options
          end
        end
      end
    end
  end
end
