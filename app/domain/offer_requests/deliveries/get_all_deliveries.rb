require_relative '../../common/query'

module OfferRequests
  module Deliveries
    class GetAllDeliveries
      include Common::Query

      def initialize(repository = DeliveryRepository.new, mapper = DeliveryMapper.new)
        super
      end
    end
  end
end
