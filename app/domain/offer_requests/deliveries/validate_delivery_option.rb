module OfferRequests
  module Deliveries
    class ValidateDeliveryOption
      takes :delivery_repository

      InvalidDeliveryOption = Class.new(StandardError) do
        takes :kind, :errors
      end

      def call(delivery_id)
        raise InvalidDeliveryOption.new :invalid_attributes, errors: { delivery_id: 'delivery option does not exist' } unless delivery_exists?(delivery_id)
      end

      def delivery_exists?(delivery_id)
        devliery(delivery_id).present?
      end

      def devliery(delivery_id)
        @devliery ||= delivery_repository.find_by(id: delivery_id)
      end
    end
  end
end
