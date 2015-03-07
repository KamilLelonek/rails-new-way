require_relative '../../common/query'

module Juices
  module Ingredients
    class GetAllIngredients
      include Common::Query

      def initialize(repository = IngredientRepository.new, mapper = IngredientMapper.new)
        super
      end
    end
  end
end
