class AppCreator
  attr_reader :ingredient_adapter, :ingredient_repository, :get_all_ingredients

  def initialize
    initialize_ingredients
  end

  def initialize_ingredients
    @ingredient_adapter    = InMemoryIngredientAdapter.new
    @ingredient_repository = Juices::Ingredients::IngredientRepository.new(ingredient_adapter)
    @get_all_ingredients   = Juices::Ingredients::GetAllIngredients.new(ingredient_repository)
  end
end
