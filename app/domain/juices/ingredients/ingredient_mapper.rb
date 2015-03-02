module Juices
  module Ingredients
    class IngredientMapper
      def call(record)
        IngredientValueObject.new(name: record.name)
      end
    end
  end
end
