module OfferRequests
  module Deliveries
    class DeliveryEntity
      include ::Virtus.model

      attribute :id,          String
      attribute :name,        String
      attribute :description, String
    end
  end
end
