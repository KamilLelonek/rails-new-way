module Juices
  module Ingredients
    class IngredientsController < ApplicationController
      def index
        render json: get_all_ingredients.()
      end

      private
      def get_all_ingredients
        GetAllIngredients.new
      end
    end
  end
end
