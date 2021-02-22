module Trestle
  module Search
    class Filters
      class Definition
        attr_reader :blocks

        def initialize
          @blocks = []
        end

        def append(&block)
          @blocks << Block.new(&block)
        end

        # Evaluates each of the filter blocks within the given admin context
        # and returns a hash of of Filter objects keyed by the filter name.
        def evaluate(context)
          @blocks.map { |block| block.filters(context) }.flatten.index_by(&:name)
        end
      end
    end
  end
end
