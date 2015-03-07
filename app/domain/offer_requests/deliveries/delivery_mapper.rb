module OfferRequests
  module Deliveries
    class DeliveryMapper
      def call(record)
        DeliveryEntity.new(
          id:          record.id,
          name:        record.name,
          description: record.description,
        )
      end
    end
  end
end
