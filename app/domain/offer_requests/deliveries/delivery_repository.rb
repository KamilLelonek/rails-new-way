require_relative '../../common/repository'

module OfferRequests
  module Deliveries
    class DeliveryRepository
      include Common::Repository

      def initialize(adapter = Delivery)
        super
      end
    end
  end
end
