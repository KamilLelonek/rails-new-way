class AppCreator
  attr_reader :ingredient_adapter,                         :ingredient_repository,               :get_all_ingredients,
              :category_adapter,                           :category_repository,                 :get_all_categories,
              :delivery_adapter,                           :delivery_repository,                 :get_all_deliveries,
              :offer_request_read_model_in_memory_adapter, :offer_request_read_model_repository, :get_all_offer_request_read_models,
              :offer_request_in_memory_adapter,            :offer_request_repository

  def initialize
    initialize_ingredients
    initialize_categories
    initialize_deliveries
    initialize_offer_requests
  end

  def initialize_ingredients
    @ingredient_adapter    = InMemoryAdapter.new
    @ingredient_repository = Juices::Ingredients::IngredientRepository.new(ingredient_adapter)
    @get_all_ingredients   = Juices::Ingredients::GetAllIngredients.new(ingredient_repository)
  end

  def initialize_categories
    @category_adapter    = InMemoryAdapter.new
    @category_repository = Juices::Categories::CategoryRepository.new(category_adapter)
    @get_all_categories  = Juices::Categories::GetAllCategories.new(category_repository)
  end

  def initialize_deliveries
    @delivery_adapter    = InMemoryAdapter.new
    @delivery_repository = OfferRequests::Deliveries::DeliveryRepository.new(delivery_adapter)
    @get_all_deliveries  = OfferRequests::Deliveries::GetAllDeliveries.new(delivery_repository)
  end

  def initialize_offer_requests
    @offer_request_in_memory_adapter            = InMemoryAdapter.new
    @offer_request_repository                   = OfferRequests::OfferRequestRepository.new(offer_request_in_memory_adapter)
    @offer_request_read_model_in_memory_adapter = InMemoryAdapter.new
    @offer_request_read_model_repository        = OfferRequests::ReadModel::OfferRequestReadModelRepository.new(offer_request_read_model_in_memory_adapter)
    @get_all_offer_request_read_models          = OfferRequests::ReadModel::GetAllOfferRequestReadModels.new(offer_request_read_model_repository)
  end
end
