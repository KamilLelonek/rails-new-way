module Juices
  module Ingredients
    class IngredientRepository
      def initialize(adapter = Ingredient)
        @adapter = adapter
      end

      delegate :hello, :all, to: :adapter

      private
      attr_reader :adapter
    end
  end
end
