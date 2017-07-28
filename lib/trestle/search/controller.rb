module Trestle
  module Search
    module Controller
      def index
        super

        if admin.searchable? && params[:q].present?
          breadcrumb t("admin.search.results", default: "Search Results"), { q: params[:q] }
        end
      end
    end
  end
end
