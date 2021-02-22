module Trestle
  module Search
    class Filters
      class Block
        attr_reader :block

        def initialize(&block)
          @block = block
        end

        def filters(context)
          context = Evaluator.new(context)
          context.instance_exec(context, &block)
          context.filters
        end

        class Evaluator
          include Trestle::EvaluationContext

          attr_reader :filters

          def initialize(context=nil)
            @context = context
            @filters = []
          end

          def filter(name, options={}, &block)
            filters << Filter.new(@context, name, options, &block)
          end
        end
      end
    end
  end
end
