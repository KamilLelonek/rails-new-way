module OfferRequests
  module Deliveries
    class ValidateDeliveryOption
      takes :delivery_option_repository

      InvalidDeliveryOption = Class.new(StandardError) do
        takes :kind, :errors
      end

      def call(delivery_option_id)
        raise InvalidDeliveryOption.new :invalid_attributes, errors: { delivery_option_id: 'delivery option does not exist' } unless delivery_option_exists?(delivery_option_id)
      end

      def delivery_option_exists?(delivery_option_id)
        devliery_option(delivery_option_id).present?
      end

      def devliery_option(delivery_option_id)
        @devliery_option ||= delivery_option_repository.find_by(id: delivery_option_id)
      end
    end
  end
end
