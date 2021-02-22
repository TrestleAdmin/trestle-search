module Trestle
  module Search
    class Filters
      class TextRenderer < Renderer
        def render
          builder.text_field(name, options)
        end
      end
    end
  end
end
