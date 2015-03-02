module Juices
  module Ingredients
    class GetAllIngredients
      def initialize(repository = IngredientRepository.new)
        @repository = repository
      end

      def call
        repository.all
      end

      private
      attr_reader :repository
    end
  end
end
