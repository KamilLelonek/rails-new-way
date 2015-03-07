require_relative '../../common/repository'

module Juices
  module Ingredients
    class IngredientRepository
      include Common::Repository

      def initialize(adapter = Ingredient)
        super
      end
    end
  end
end
