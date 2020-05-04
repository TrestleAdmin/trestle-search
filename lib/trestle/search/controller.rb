module Trestle
  module Search
    module Controller
      def index
        if admin.searchable? && params[:q].present?
          breadcrumb t("admin.search.results", default: "Search Results"), { q: params[:q] }
        end

        super
      end
    end
  end
end
