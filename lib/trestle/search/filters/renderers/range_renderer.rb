module Trestle
  module Search
    class Filters
      class RangeRenderer < Renderer
        def render
          builder.fields_for name do |f|
            builder.form_group name, options do
              row do
                concat col { f.text_field(:min, options.merge(wrapper: false, value: value[:min], placeholder: placeholder[:min])) }
                concat col { f.text_field(:max, options.merge(wrapper: false, value: value[:max], placeholder: placeholder[:max])) }
              end
            end
          end
        end

        def value
          params[name] || {}
        end

      private
        def row(&block)
          content_tag(:div, class: "row", &block)
        end

        def col(&block)
          content_tag(:div, class: "col", &block)
        end

        def placeholder
          @placeholder ||= begin
            placeholder = options[:placeholder]
            placeholder.is_a?(Hash) ? placeholder : { min: placeholder, max: placeholder }
          end
        end
      end
    end
  end
end
