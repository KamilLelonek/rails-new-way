module Juices
  module Ingredients
    class IngredientValueObject
      include ::Virtus.value_object

      values do
        attribute :name, String
      end
    end
  end
end
