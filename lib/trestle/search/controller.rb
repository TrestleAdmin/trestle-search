module Trestle
  module Search
    module Controller
      def index
        if admin.searchable? && params[:q].present?
          self.collection = admin.search(params[:q], params)
          breadcrumb "Search Results"
        else
          super
        end
      end
    end
  end
end
