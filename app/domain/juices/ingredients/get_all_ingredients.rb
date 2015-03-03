require_relative '../../common/query'

module Juices
  module Ingredients
    class GetAllIngredients
      include ::Query

      def initialize(repository = IngredientRepository.new)
        super
      end
    end
  end
end
