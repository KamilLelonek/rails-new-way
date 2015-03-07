module OfferRequests
  module Deliveries
    class DeliveryMapper
      def call(record)
        DeliveryEntity.new(
          id:          record.id,
          description: record.description,
        )
      end
    end
  end
end
