module Trestle
  module Search
    module Builder
      def search(&block)
        admin.define_adapter_method(:search, &block)
      end
    end
  end
end
