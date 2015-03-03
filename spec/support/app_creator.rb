class AppCreator
  attr_reader :ingredient_adapter, :ingredient_repository, :get_all_ingredients,
              :category_adapter,  :category_repository,    :get_all_categories

  def initialize
    initialize_ingredients
    initialize_categories
  end

  def initialize_ingredients
    @ingredient_adapter    = InMemoryIngredientAdapter.new
    @ingredient_repository = Juices::Ingredients::IngredientRepository.new(ingredient_adapter)
    @get_all_ingredients   = Juices::Ingredients::GetAllIngredients.new(ingredient_repository)
  end

  def initialize_categories
    @category_adapter    = InMemoryIngredientAdapter.new
    @category_repository = Juices::Categories::CategoryRepository.new(category_adapter)
    @get_all_categories  = Juices::Categories::GetAllCategories.new(category_repository)
  end
end
