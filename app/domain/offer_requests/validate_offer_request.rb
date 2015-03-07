module OfferRequests
  class ValidateOfferRequest
    takes :category_repository, :delivery_repository

    InvalidOfferRequest = Class.new(StandardError) do
      takes :kind, :errors
    end

    def call(offer_requests_params)
      validate_form_object offer_requests_params
      validate_products_categories offer_request_form_object
      validate_delivery_option offer_request_form_object
      offer_request_form_object
    end

    private
    def offer_request_form_object
      @offer_request_form_object ||= OfferRequests::OfferRequestFormObject.new
    end

    def validate_form_object(offer_requests_params)
      raise InvalidOfferRequest.new :invalid_attributes, errors: offer_request_form_object.errors.messages unless offer_request_form_object.validate(offer_requests_params)
    rescue NoMethodError
      raise InvalidOfferRequest.new :invalid_attributes, errors: { products: ['should be an array'], cause: $!.message }
    end

    def validate_products_categories(offer_request_form_object)
      raise InvalidOfferRequest.new :invalid_attributes, errors: { category_id: 'category does not exist' } unless all_products_valid(offer_request_form_object)
    end

    def all_products_valid(offer_request_form_object)
      offer_request_form_object.products.all? do |product|
        Common::ExistencePolicy.new(category_repository).is_satisfied_by?(product.category_id)
      end
    end

    def validate_delivery_option(offer_request_form_object)
      Deliveries::ValidateDeliveryOption
        .new(delivery_repository)
        .(offer_request_form_object.delivery_id)
    rescue Deliveries::ValidateDeliveryOption::InvalidDeliveryOption => e
      raise InvalidOfferRequest.new e.kind, e.errors
    end
  end
end
