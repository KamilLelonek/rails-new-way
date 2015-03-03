require_relative '../../common/repository'

module Juices
  module Ingredients
    class IngredientRepository
      include ::Repository

      def initialize(adapter = Ingredient)
        super
      end
    end
  end
end
