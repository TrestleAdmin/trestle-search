module Trestle
  module Search
    module Builder
      def search(&block)
        admin.search = block
      end
    end
  end
end
