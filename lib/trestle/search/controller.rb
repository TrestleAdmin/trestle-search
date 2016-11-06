module Trestle
  module Search
    module Controller
      def index
        super

        if admin.searchable? && params[:q].present?
          breadcrumb "Search Results", { q: params[:q] }
        end
      end
    end
  end
end
