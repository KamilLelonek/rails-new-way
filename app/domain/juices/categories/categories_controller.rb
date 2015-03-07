module Juices
  module Categories
    class CategoriesController < ApplicationController
      def index
        render json: get_all_categories.load_all
      end

      private
      def get_all_categories
        GetAllCategories.new
      end
    end
  end
end
